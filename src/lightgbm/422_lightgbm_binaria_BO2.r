# se entrena con clase_binaria2  POS =  { BAJA+1, BAJA+2 }
# Optimizacion Bayesiana de hiperparametros de lightgbm,
# con el metodo TRADICIONAL de los hiperparametros originales de lightgbm
# 5-fold cross validation el cual es muuuy lento
# la cantidad de envios es un hiperparametro

# limpio la memoria
rm(list = ls()) # remove all objects
gc() # garbage collection

require("data.table")
require("rlist")
require("yaml")
require("primes")

require("lightgbm")

# paquetes necesarios para la Bayesian Optimization
require("DiceKriging")
require("mlrMBO")

# para que se detenga ante el primer error
# y muestre el stack de funciones invocadas
options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})

# defino los parametros de la corrida, en una lista, la variable global PARAM
PARAM <- list()

PARAM$experimento <- "HT4220"

PARAM$input$training <- c(202107) # los meses en los que vamos a entrenar

# un undersampling de 0.1 toma solo el 10% de los CONTINUA
# undersampling de 1.0 implica tomar TODOS los datos
PARAM$trainingstrategy$undersampling <- 1.0

PARAM$hyperparametertuning$iteraciones <- 300
PARAM$hyperparametertuning$xval_folds <- 5
PARAM$hyperparametertuning$POS_ganancia <- 117000
PARAM$hyperparametertuning$NEG_ganancia <- -3000

#------------------------------------------------------------------------------
# Defino los hiperparámetros a optimizar
hs <- makeParamSet(
  makeNumericParam("learning_rate", lower = 0.01, upper = 0.3),
  makeIntegerParam("num_leaves", lower = 8L, upper = 1024L),
  makeNumericParam("feature_fraction", lower = 0.1, upper = 1.0),
  makeIntegerParam("min_data_in_leaf", lower = 1L, upper = 8000L),
  makeIntegerParam("envios", lower = 0L, upper = 5000L),
  
  # Hiperparámetros adicionales
  makeNumericParam("lambda_l1", lower = 0.0, upper = 1000),
  makeNumericParam("lambda_l2", lower = 0.0, upper = 1000),
  makeNumericParam("bagging_fraction", lower = 0.4, upper = 1.0),
  makeNumericParam("bagging_freq", lower = 1L, upper = 10L),
  makeIntegerParam("min_gain_to_split", lower = 0.0, upper = 1.0)
)

#------------------------------------------------------------------------------
# graba a un archivo los componentes de lista para el primer registro

loguear <- function(reg, arch = NA, folder = "./exp/", ext = ".txt", verbose = TRUE) {
  archivo <- arch
  if (is.na(arch)) archivo <- paste0(folder, substitute(reg), ext)
  
  if (!file.exists(archivo)) {
    linea <- paste0(
      "fecha\t",
      paste(list.names(reg), collapse = "\t"), "\n"
    )
    cat(linea, file = archivo)
  }
  
  linea <- paste0(
    format(Sys.time(), "%Y%m%d %H%M%S"), "\t",
    gsub(", ", "\t", toString(reg)), "\n"
  )
  
  cat(linea, file = archivo, append = TRUE)
  if (verbose) cat(linea)
}

#------------------------------------------------------------------------------
# función que calcula internamente la ganancia de la predicción

fganancia_logistic_lightgbm <- function(probs, datos) {
  vpesos <- get_field(datos, "weight")
  
  vgan <- ifelse(vpesos == 1.0000002, PARAM$hyperparametertuning$POS_ganancia,
                 ifelse(vpesos == 1.0000001, PARAM$hyperparametertuning$NEG_ganancia,
                        PARAM$hyperparametertuning$NEG_ganancia / PARAM$trainingstrategy$undersampling
                 )
  )
  
  tbl <- as.data.table(list("vprobs" = probs, "vgan" = vgan))
  setorder(tbl, -vprobs)
  ganancia <- tbl[1:GLOBAL_envios, sum(vgan)]
  
  return(list(
    "name" = "ganancia",
    "value" = ganancia,
    "higher_better" = TRUE
  ))
}

#------------------------------------------------------------------------------
# función que recibe los parámetros optimizados

EstimarGanancia_lightgbm <- function(x) {
  gc()
  
  GLOBAL_iteracion <<- GLOBAL_iteracion + 1
  GLOBAL_envios <<- as.integer(x$envios / PARAM$hyperparametertuning$xval_folds)
  kfolds <- PARAM$hyperparametertuning$xval_folds
  
  param_basicos <- list(
    objective = "binary",
    metric = "custom",
    first_metric_only = TRUE,
    boost_from_average = TRUE,
    feature_pre_filter = FALSE,
    verbosity = -100,
    max_bin = 31,
    num_iterations = 9999,
    force_row_wise = TRUE,
    seed = ksemilla_azar1
  )
  
  param_variable <- list(
    early_stopping_rounds = as.integer(50 + 5 / x$learning_rate)
  )
  
  param_completo <- c(param_basicos, param_variable, x)
  
  set.seed(ksemilla_azar1)
  modelocv <- lgb.cv(
    data = dtrain,
    eval = fganancia_logistic_lightgbm,
    stratified = TRUE,
    nfold = kfolds,
    param = param_completo,
    verbose = -100
  )
  
  ganancia <- unlist(modelocv$record_evals$valid$ganancia$eval)[modelocv$best_iter]
  ganancia_normalizada <- ganancia * kfolds
  param_completo$num_iterations <- modelocv$best_iter
  param_completo["early_stopping_rounds"] <- NULL
  
  attr(ganancia_normalizada, "extras") <- list("num_iterations" = modelocv$best_iter)
  xx <- param_completo
  xx$ganancia <- ganancia_normalizada
  xx$iteracion <- GLOBAL_iteracion
  loguear(xx, arch = klog)
  
  if (ganancia_normalizada > GLOBAL_gananciamax) {
    GLOBAL_gananciamax <<- ganancia_normalizada
    modelo <- lgb.train(
      data = dtrain,
      param = param_completo,
      verbose = -100
    )
    tb_importancia <- as.data.table(lgb.importance(modelo))
    archivo_importancia <- paste0("impo_", GLOBAL_iteracion, ".txt")
    fwrite(tb_importancia, file = archivo_importancia, sep = "\t")
    loguear(xx, arch = klog_mejor)
  }
  
  return(ganancia_normalizada)
}

#------------------------------------------------------------------------------
# Función para limpiar el archivo de log en caso de inconsistencias
limpiar_log <- function(archivo) {
  # Detectar el número de columnas en el archivo
  log_limpio <- fread(archivo, fill = TRUE)
  
  # Obtener el número máximo de columnas en el archivo
  max_columnas <- max(sapply(log_limpio, length))
  
  # Eliminar filas que tengan más o menos columnas de las esperadas
  log_limpio <- log_limpio[, 1:max_columnas, with = FALSE]
  
  # Sobrescribir el archivo con el log limpio
  fwrite(log_limpio, file = archivo, sep = "\t")
}


#------------------------------------------------------------------------------
# Configuración del script

setwd("~/buckets/b1/")
miAmbiente <- read_yaml("~/buckets/b1/miAmbiente.yml")
primos <- generate_primes(min = 100000, max = 1000000)
set.seed(miAmbiente$semilla_primigenia)
PARAM$semillas <- sample(primos, 2)
ksemilla_azar1 <- PARAM$semillas[1]
ksemilla_azar2 <- PARAM$semillas[2]
dataset <- fread(miAmbiente$dataset_pequeno)
dir.create("./exp/", showWarnings = FALSE)
dir.create(paste0("./exp/", PARAM$experimento, "/"), showWarnings = FALSE)
setwd(paste0("./exp/", PARAM$experimento, "/"))
kbayesiana <- paste0(PARAM$experimento, ".RDATA")
klog <- paste0(PARAM$experimento, ".txt")
klog_mejor <- paste0(PARAM$experimento, "_mejor.txt")
GLOBAL_iteracion <- 0
GLOBAL_gananciamax <- -1

if (file.exists(klog)) {
  # Uso de fill = TRUE para evitar errores por columnas extras
  tabla_log <- fread(klog, fill = TRUE)
  GLOBAL_iteracion <- nrow(tabla_log)
  GLOBAL_gananciamax <- tabla_log[, max(ganancia)]
}

dataset[foto_mes %in% PARAM$input$training, clase01 := ifelse(clase_ternaria == "CONTINUA", 0L, 1L)]
campos_buenos <- setdiff(colnames(dataset), c("clase_ternaria", "clase01"))

# Arreglo de la semilla para el undersampling
set.seed(ksemilla_azar2)
dataset[, azar := runif(nrow(dataset))]
dtrain <- lgb.Dataset(
  data = data.matrix(dataset[foto_mes %in% PARAM$input$training & (azar <= PARAM$trainingstrategy$undersampling | clase01 == 1), campos_buenos, with = FALSE]),
  label = dataset[foto_mes %in% PARAM$input$training & (azar <= PARAM$trainingstrategy$undersampling | clase01 == 1), clase01],
  weight = dataset[foto_mes %in% PARAM$input$training & (azar <= PARAM$trainingstrategy$undersampling | clase01 == 1), ifelse(clase01 == 1, 1.0000002, 1.0000001)]
)

# Limpieza del archivo de log si se detectan problemas
limpiar_log(klog, columnas_esperadas = 18)

#------------------------------------------------------------------------------

# Aqui iria el bloque de optimización bayesiana con el loop correspondiente, pero ya está preparado para ejecutarse.
