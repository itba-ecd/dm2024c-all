# Comparamos los resultados

# 1 Comparamos escenarios A y B
wilcox.test( 
  c(5.419,	5.769,	5.359,	8.239,	5.689),
  c(5.799	,5.199,	5.289,	5.689,	5.499),
  paired = TRUE
)
#Resultado p-value= 0.3125 - No se rechaza la hipótesis que dice que tienen la misma mediana

# 2 Comparamos A y C - Elegimos a A porque es el que tiene mayor ganancia promedio
wilcox.test(
  c(5.419,	5.769,	5.359,	8.239,	5.689),
  c(6.479,	6.869,	6.039,	6.089,	6.479),
  paired = TRUE
)

# Resultado p-valor=0.625 No se rechaza la hipótesis que dice que tienen la misma mediana


# 3 Comparamos C y D - Elegimos C porque es el que tiene mayor ganancia
wilcox.test(
  c(6.479,	6.869,	6.039,	6.089,	6.479,	6.529,	5.269,	5.669,	6.509,	6.149),
  c(6.529	,5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479),
  paired = TRUE
)

# Resultado p-valor=0.3223 No se rechaza la hipótesis que dice que tienen la misma mediana

c# 4 ganancias. Comparamos D y E - Elegimos D que es el de mayor ganancia pero es indistinto
wilcox.test( 
  c(6.529	,5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479),
  c(6.019,	6.029,	5.629,	6.969,	5.389,	5.749,	6.579,	4.209,	6.739,	7.009),
  paired = TRUE
)
# Resultado p-valor=0.5566 No se rechaza la hipótesis que dice que tienen la misma mediana

# 5 ganancias Comparamos D y F
wilcox.test( 
  c(6.529	,5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479),
  c(6.069,	5.389,	6.539,	5.549,	6.349,	5.409,	5.459,	5.919,	5.169,	7.059),
  paired = TRUE
)
# Resultado p-valor=0.04883, menor que 0.05 por lo que se rechaza la hipótesis que dice que tienen la misma mediana

m1= c(6.529	,5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479)
m2=c(6.069,	5.389,	6.539,	5.549,	6.349,	5.409,	5.459,	5.919,	5.169,	7.059)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 

# La mediana de la muestra D es mayor a la de F, por lo que continuamos con F

# 6 ganancias - Comparamos F con G
wilcox.test( 
  c(6.069,	5.389,	6.539,	5.549,	6.349,	5.409,	5.459,	5.919,	5.169,	7.059),
  c(6.399,	5.979,	6.819,	6.589,	5.949,	6.689,	5.939,	5.479,	6.369,	6.039),
  paired = TRUE
)
# Resultado p-valor=0.1934 No se rechaza la hipótesis que dice que tienen la misma mediana

# 7 ganancias Comparamos G (lo elegimos por ser el de mayor valor promedio) y H. Como H tiene 15 semillas tomamos las primeras 10
wilcox.test( 
  c(6.399,	5.979,	6.819,	6.589,	5.949,	6.689,	5.939,	5.479,	6.369,	6.039),
  c(6.239,	5.729,	5.829,	5.059,	5.739,	6.119,	6.459,	5.909,	7.349,	5.399),
  paired = TRUE
)

# Resultado p-valor=0.3223 No se rechaza la hipótesis que dice que tienen la misma mediana

# 8 ganancias Comparamos H (es indistinto tomar H o G elegimos H porque las siguientes muestras tienen 15 semillas) con I
t.test( 
  c(6.239,	5.729,	5.829,	5.059,	5.739,	6.119,	6.459,	5.909,	7.349,	5.399,	6.289,	6.109,	6.579,	6.979,	5.899),
  c(6.349,	6.269,	6.219,	6.259,	6.239,	5.489,	6.609,	5.899,	5.799,	5.389,	5.769,	5.009,	6.349,	6.309,	6.639),
  paired = TRUE
)

# Hicimos un student test porque no nos dejaba correr el Willcoxon, entendemos por la cantidad de valores en caqda muestra. 
# Resultado p-valor=0.7048 No se rechaza la hipótesis que dice que tienen la misma mediana

# 9 ganancias Comparamos H (por ser el de mayor ganancia) con J
t.test( 
  c(6.239,	5.729,	5.829,	5.059,	5.739,	6.119,	6.459,	5.909,	7.349,	5.399,	6.289,	6.109,	6.579,	6.979,	5.899),
  c(6.489,	6.059,	5.879,	6.099,	5.519,	6.819,	5.719,	6.389,	6.799,	5.579,	6.119,	6.059,	6.059,	6.569,	6.449),
  paired = TRUE
)
# Resultado p-valor=0.6477 No se rechaza la hipótesis que dice que tienen la misma mediana

# 10 ganancias Comparamos J (por ser el de mayor ganancia) con K
t.test( 
  c(6.489,	6.059,	5.879,	6.099,	5.519,	6.819,	5.719,	6.389,	6.799,	5.579,	6.119,	6.059,	6.059,	6.569,	6.449),
  c(6.529,	5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479,	6.509,	5.359,	6.309,	5.649,	4.779),
    paired = TRUE
)
# Resultado p-valor=0.6693 No se rechaza la hipótesis que dice que tienen la misma mediana

# 11 ganancias Comparamos K (por ser el de mayor ganancia) con L
t.test( 
  c(6.529,	5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479,	6.509,	5.359,	6.309,	5.649,	4.779),
  c(6.769,	6.389,	5.939,	5.739,	6.469,	5.999,	4.739,	7.129,	5.719, 6.079,	6.469,	6.939,	6.099,	6.379,	5.629),
  paired = TRUE
)
# Resultado p-valor=0.6331 No se rechaza la hipótesis que dice que tienen la misma mediana

# 12 ganancias Comparamos K (por ser el de mayor ganancia) con L
t.test( 
  c(6.529,	5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479,	6.509,	5.359,	6.309,	5.649,	4.779),
  c(6.769,	6.389,	5.939,	5.739,	6.469,	5.999,	4.739,	7.129,	5.719, 6.079,	6.469,	6.939,	6.099,	6.379,	5.629),
  paired = TRUE
)
# Resultado p-valor=0.6331 No se rechaza la hipótesis que dice que tienen la misma mediana

# 13 ganancias Comparamos K (por ser el de mayor ganancia) con M
t.test( 
  c(6.529,	5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479,	6.509,	5.359,	6.309,	5.649,	4.779),
  c(6.399,	5.979,	6.819,	6.589,	5.949,	6.689,	5.939,	5.489,	6.369,	6.039,	6.279,	6.759,	6.219,	5.519,	6.679),
)
# Resultado p-valor=0.8887 No se rechaza la hipótesis que dice que tienen la misma mediana