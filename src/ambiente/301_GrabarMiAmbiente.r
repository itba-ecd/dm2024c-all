# Este script almacena:
#   la modalidad de cursada que usted ha elegido ( Conceptual, Vivencial )
#   su semilla primigenia = su primer semilla

require("yaml")

miAmbiente <- list()

miAmbiente$modalidad <-  "conceptual"
# miAmbiente$modalidad <-  "vivencial"

miAmbiente$dataset_pequeno <- "D:/Academico/ITBA/datasets/conceptual_dataset_pequeno.csv"
# miAmbiente$dataset_pequeno <- "~/datasets/vivencial_dataset_pequeno.csv"


miAmbiente$dataset_competencia <- "D:/Academico/ITBA/datasets/conceptual_competencia_2024.csv.gz"
# miAmbiente$dataset_competencia <- "~/datasets/vivencial_competencia_2024.csv.gz"


# aqui va su primer semilla
miAmbiente$semilla_primigenia <- 487789L


write_yaml( miAmbiente,
  file="D:/Academico/ITBA/miAmbiente.yml" )


# mantenimiento del ambiente
dir.create("D:/Academico/ITBA/exp/", showWarnings = FALSE)
dir.create("D:/Academico/ITBA/repos/", showWarnings = FALSE)
dir.create("D:/Academico/ITBA/repos/labo2024ba", showWarnings = FALSE)

cat("\nel ambiente ha sido GRABADO\n")