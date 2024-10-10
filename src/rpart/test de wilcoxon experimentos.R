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

# La mediana de la muestra D es mayor a la de F, por lo que continuamos con D

# 6 ganancias - Comparamos D con G
wilcox.test( 
  c(6.529	,5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479),
  c(6.399,	5.979,	6.819,	6.589,	5.949,	6.689,	5.939,	5.479,	6.369,	6.039),
  paired = TRUE
)
# Resultado p-valor=0.2408 No se rechaza la hipótesis que dice que tienen la misma mediana


# 7 ganancias Comparamos D (lo elegimos por ser el de mayor valor promedio) y H. Como H tiene 15 semillas tomamos las primeras 10
wilcox.test( 
  c(6.529	,5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479),
  c(6.239,	5.729,	5.829,	5.059,	5.739,	6.119,	6.459,	5.909,	7.349,	5.399),
  paired = TRUE
)
# Resultado p-valor=0.2324 No se rechaza la hipótesis que dice que tienen la misma mediana

# 8 ganancias Comparamos H (es indistinto tomar H o D elegimos H porque las siguientes muestras tienen 15 semillas) con I
wilcox.test( 
  c(5.729,	5.829,	5.059,	5.739,	6.119,	6.459,	5.909,	7.349,	5.399,	6.289,	6.109,	6.579,	6.979,	5.899),
  c(6.349,	6.269,	6.219,	6.259,	5.489,	6.609,	5.899,	5.799,	5.389,	5.769,	5.009,	6.349,	6.309,	6.639),
  paired = TRUE
)
# Resultado p-valor=0.7536 No se rechaza la hipótesis que dice que tienen la misma mediana

# 9 ganancias Comparamos H (por ser el de mayor ganancia) con J
wilcox.test( 
  c(6.239,	5.729,	5.829,	5.059,	5.739,	6.119,	6.459,	5.909,	7.349,	5.399,	6.289,	6.109,	6.579,	6.979,	5.899),
  c(6.489,	6.059,	5.879,	6.099,	5.519,	6.819,	5.719,	6.389,	6.799,	5.579,	6.119,	6.059,	6.059,	6.569,	6.449),
  paired = TRUE
)
# Resultado p-valor=0.7119 No se rechaza la hipótesis que dice que tienen la misma mediana

# 10 ganancias Comparamos J (por ser el de mayor ganancia) con K
t.test( 
  c(6.489,	6.059,	5.879,	6.099,	5.519,	6.819,	5.719,	6.389,	6.799,	5.579,	6.119,	6.059,	6.059,	6.569,	6.449),
  c(6.529,	5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479,	6.509,	5.359,	6.309,	5.649,	4.779),
    paired = TRUE
)
# Resultado p-valor=0.6693 No se rechaza la hipótesis que dice que tienen la misma mediana

# 11 ganancias Comparamos K (por ser el de mayor ganancia) con L
wilcox.test( 
  c(6.529,	5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479,	6.509,	5.359,	6.309,	5.649,	4.779),
  c(6.769,	6.389,	5.939,	5.739,	6.469,	5.999,	4.739,	7.129,	5.719, 6.079,	6.469,	6.939,	6.099,	6.379,	5.629),
  paired = TRUE
)
# Resultado p-valor=0.6092 No se rechaza la hipótesis que dice que tienen la misma mediana


# 12 ganancias Comparamos K (por ser el de mayor ganancia) con M
wilcox.test( 
  c(6.529,	5.259,	7.539,	6.689,	6.199,	6.159,	5.969,	8.249,	6.569,	6.479,	6.509,	5.359,	6.309,	5.649,	4.779),
  c(6.399,	5.979,	6.819,	6.589,	5.949,	6.689,	5.939,	5.489,	6.369,	6.039,	6.279,	6.759,	6.219,	5.519,	6.679),
paired = TRUE)
# Resultado p-valor=0.532 No se rechaza la hipótesis que dice que tienen la misma mediana


# 13 ganancias Comparamos M (por ser el de mayor ganancia) con N (tiene 25 semillas tomamos las primeras 15)
wilcox.test( 
  c(6.399,	5.979,	6.819,	6.589,	5.949,	6.689,	5.939,	5.489,	6.369,	6.039,	6.279,	6.759,	6.219,	5.519,	6.679),
  c(6.119,	5.599,	6.359,	5.749,	6.049,	5.679,	6.089,	6.489,	5.819,	6.509,	6.089,	6.159,	6.089,	6.119,	5.649),
paired = TRUE)
# Resultado p-valor=0.1688 No se rechaza la hipótesis que dice que tienen la misma mediana


# 14 ganancias Comparamos M (por ser el de mayor ganancia, tomamos los primeros 10 valores porque O tiene 10) con O. 
wilcox.test( 
  c(6.399,	5.979,	6.819,	6.589,	5.949,	6.689,	5.939,	5.489,	6.369,	6.039),
  c(6.209,	5.849,	6.619,	6.529,	6.949,	6.279,	5.829,	6.309,	6.689,	5.339),
)
# Resultado p-valor=1 No se rechaza la hipótesis que dice que tienen la misma mediana
# No es un valor exacto por el problema de las ties


# 15 ganancias Comparamos O con P. 
wilcox.test( 
  c(6.209,	5.849,	6.619,	6.529,	6.949,	6.279,	5.829,	6.309,	6.689,	5.339),
  c(6.409,	5.949,	5.959,	6.069,	5.639,	7.239,	5.989,	5.959,	4.859,	5.209),paired = TRUE)
# Resultado p-valor=0.2754 No se rechaza la hipótesis que dice que tienen la misma mediana


# 16 ganancias Comparamos O con Q (tomo los primeros 10). 
wilcox.test( 
  c(6.209,	5.849,	6.619,	6.529,	6.949,	6.279,	5.829,	6.309,	6.689,	5.339),
  c(6.459,	4.669,	4.649,	5.679,	5.699,	6.039,	6.069,	5.649,	7.599,	5.759),
  paired= TRUE)
# Resultado p-valor=0.2408 No se rechaza la hipótesis que dice que tienen la misma mediana

# 17 ganancias Comparamos Q (es lo mismo elegir Q u O elijo Q porque tiene 20 elementos) con R. 
wilcox.test( 
  c(6.459,	4.669,	4.649,	5.679,	5.699,	6.039,	6.069,	5.649,	7.599, 5.759,	5.519,	6.009,	6.559,	5.879,	6.939,	5.859,	5.339,	6.789,	7.559,	4.319),
  c(6.309,	4.879,	5.969,	5.159,	7.879,	5.809,	5.739,	5.369,	7.359,	5.659,	6.539,	5.659,	6.809,	5.319,	7.129,	6.049,	5.569,	6.269,	7.369,	4.869),
  paired= TRUE)
# Resultado p-valor=0.9851 No se rechaza la hipótesis que dice que tienen la misma mediana


# 18 ganancias Comparamos Q con S 
wilcox.test( 
  c(6.459,	4.669,	4.649,	5.679,	5.699,	6.039,	6.069,	5.649,	7.599, 5.759,	5.519,	6.009,	6.559,	5.879,	6.939,	5.859,	5.339,	6.789,	7.559,	4.319),
  c(5.709,	6.229	,5.459,	5.079,	4.389,	5.939,	6.669,	5.139,	4.989,	5.519,	7.509,	6.619,	5.919,	6.129,	5.599,	5.549,	6.319,	6.679,	5.559,	5.129),
  paired= TRUE)
# Resultado p-valor=0.695 No se rechaza la hipótesis que dice que tienen la misma mediana


# 19 ganancias Comparamos Q con T 
wilcox.test( 
  c(6.459,	4.669,	4.649,	5.679,	5.699,	6.039,	6.069,	5.649,	7.599, 5.759,	5.519,	6.009,	6.559,	5.879,	6.939,	5.859,	5.339,	6.789,	7.559,	4.319),
  c(4.779,	5.009,	5.739,	5.919,	4.789,	5.109,	6.879,	5.149,	6.369,	5.929,	6.439,	6.199,	5.899,	3.879,	6.429,	6.599,	6.779,	6.729,	5.049,	4.299),
  paired= TRUE)
# Resultado p-valor=0.4524 No se rechaza la hipótesis que dice que tienen la misma mediana

# 20 ganancias Comparamos Q con U 
wilcox.test( 
  c(6.459,	4.669,	4.649,	5.679,	5.699,	6.039,	6.069,	5.649,	7.599, 5.759,	5.519,	6.009,	6.559,	5.879,	6.939,	5.859,	5.339,	6.789,	7.559,	4.319),
  c(4.429,	6.269,	5.119,	5.439,	6.409,	7.459,	6.669,	3.949,	6.009,	5.289,	5.969,	7.229,	5.499,	5.319,	6.229,	4.639,	4.279,	4.319,	5.969,	7.179),
  paired= TRUE)
# Resultado p-valor=0.3409 No se rechaza la hipótesis que dice que tienen la misma mediana


# 21 ganancias Comparamos Q con V 
wilcox.test( 
  c(6.459,	4.669,	4.649,	5.679,	5.699,	6.039,	6.069,	5.649,	7.599, 5.759,	5.519,	6.009,	6.559,	5.879,	6.939,	5.859,	5.339,	6.789,	7.559,	4.319),
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289),
  paired= TRUE)
# Resultado p-valor=0.007296 Se rechaza la hipótesis que dice que tienen la misma mediana porque el p-valor es menor que 0.05

m1= c(6.459,	4.669,	4.649,	5.679,	5.699,	6.039,	6.069,	5.649,	7.599, 5.759,	5.519,	6.009,	6.559,	5.879,	6.939,	5.859,	5.339,	6.789,	7.559,	4.319)
m2= c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 

# La mediana de la muestra V es mayor a la de Q, por lo que continuamos con V

# 22 ganancias Comparamos V con W 
wilcox.test( 
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289),
  c(6.569,	5.829,	5.369,	5.779,	5.739,	5.649,	4.969,	6.259,	5.729,	6.219,	6.179,	5.319,	5.819,	6.169,	6.479,	6.219,	5.729,	4.559,	6.499,	6.269),
  paired= TRUE)
# Resultado p-valor=0.0008507. Se rechaza la hipótesis que dice que tienen la misma mediana porque el p-valor es menor que 0.05

m1= c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289)
m2= c(6.569,	5.829,	5.369,	5.779,	5.739,	5.649,	4.969,	6.259,	5.729,	6.219,	6.179,	5.319,	5.819,	6.169,	6.479,	6.219,	5.729,	4.559,	6.499,	6.269)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 

# La mediana de la muestra V es mayor a la de W, por lo que continuamos con V

# 23 ganancias Comparamos V con Z 
wilcox.test( 
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289),
  c(6.749,	7.879,	5.879,	6.789,	6.219,	6.549,	6.059,	5.879,	4.979,	6.419,	6.689,	6.439,	6.569,	6.519,	6.779,	6.659,	6.659,	6.569,	7.199,	6.399),
  paired= TRUE)
# Resultado p-valor=0.9553 No se rechaza la hipótesis que dice que tienen la misma mediana


# 24 ganancias Comparamos V con ZA 
wilcox.test( 
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289),
  c(6.329,	6.389,	5.109,	5.609,	6.309,	5.919,	6.369,	6.319,	5.939	,5.969	,6.439,	5.989,	5.589,	6.089,	6.099,	5.569,	6.329,	5.599,	6.339,	5.689),
  paired= TRUE)
# Resultado p-valor=0.0001678.Se rechaza la hipótesis que dice que tienen la misma mediana porque el p-valor es menor que 0.05

m1= c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289)
m2= c(6.329,	6.389,	5.109,	5.609,	6.309,	5.919,	6.369,	6.319,	5.939	,5.969	,6.439,	5.989,	5.589,	6.089,	6.099,	5.569,	6.329,	5.599,	6.339,	5.689)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 

# La mediana de la muestra V es mayor a la de ZA, por lo que continuamos con V

# 25 ganancias Comparamos V con ZB 
wilcox.test( 
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289),
  c(6.149,	5.399,	5.419,	5.879,	5.769,	6.059,	6.619,	6.469,	6.999,	6.869,	6.259,	6.209,	6.289,	7.059,	6.229,	7.989,	6.549,	5.429,	6.489,	4.469),
  paired= TRUE)
# Resultado p-valor=0.02895.Se rechaza la hipótesis que dice que tienen la misma mediana porque el p-valor es menor que 0.05

m1= c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289)
m2= c(6.149,	5.399,	5.419,	5.879,	5.769,	6.059,	6.619,	6.469,	6.999,	6.869,	6.259,	6.209,	6.289,	7.059,	6.229,	7.989,	6.549,	5.429,	6.489,	4.469)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 
# La mediana de la muestra V es mayor a la de ZB, por lo que continuamos con V

# 26 ganancias Comparamos V con D8 
wilcox.test( 
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289),
  c(4.099,	5.879,	5.179,	5.009,	5.909,	7.439,	5.919,	4.719,	5.509,	4.929,	5.149,	7.239,	5.969,	4.989,	5.039,	4.339,	4.209,	4.729,	5.559,	6.699),
  paired= TRUE)
# Resultado p-valor=0.00008909.Se rechaza la hipótesis que dice que tienen la misma mediana porque el p-valor es menor que 0.05
m1= c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289)
m2= c(4.099,	5.879,	5.179,	5.009,	5.909,	7.439,	5.919,	4.719,	5.509,	4.929,	5.149,	7.239,	5.969,	4.989,	5.039,	4.339,	4.209,	4.729,	5.559,	6.699)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 
# La mediana de la muestra V es mayor a la de D8, por lo que continuamos con V

# 27 ganancias Comparamos V con D5 
wilcox.test( 
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289),
  c(5.769,	6.709,	6.149,	5.769,	4.679,	5.789,	5.889,	6.979,	6.619,	5.309,	6.009,	5.889,	5.879,	6.219,	5.329,	5.499,	5.729,	7.069,	6.589,	6.589),
  paired= TRUE)
# Resultado p-valor=0.00642.Se rechaza la hipótesis que dice que tienen la misma mediana porque el p-valor es menor que 0.05
m1= c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759,	6.319,	6.419,	5.649,	6.469,	6.719,	5.119,	6.589,	6.759,	7.539,	6.289)
m2= c(5.769,	6.709,	6.149,	5.769,	4.679,	5.789,	5.889,	6.979,	6.619,	5.309,	6.009,	5.889,	5.879,	6.219,	5.329,	5.499,	5.729,	7.069,	6.589,	6.589)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 
# La mediana de la muestra V es mayor a la de D5, por lo que continuamos con V


# 28 ganancias Comparamos V con D6 (10 semillas) 
wilcox.test( 
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759),
  c(6.289,	6.739,	5.919,	5.869,	5.209,	5.479,	6.009,	6.989,	6.389,	5.099),
  paired= TRUE)
# Resultado p-valor=0.01437.Se rechaza la hipótesis que dice que tienen la misma mediana porque el p-valor es menor que 0.05
m1= c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759)
m2= c(6.289,	6.739,	5.919,	5.869,	5.209,	5.479,	6.009,	6.989,	6.389,	5.099)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 
# La mediana de la muestra V es mayor a la de D6, por lo que continuamos con V



# 29 ganancias Comparamos V con D7 (10 semillas) 
wilcox.test( 
  c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759),
  c(3.869,	5.559,	4.969,	4.449,	6.529,	7.609,	6.889,	4.589,	5.739,	5.139),
  paired= TRUE)
# Resultado p-valor=0.01367.Se rechaza la hipótesis que dice que tienen la misma mediana porque el p-valor es menor que 0.05
m1= c(6.699,	6.349,	6.419,	6.369,	6.729,	6.439,	7.269,	6.949,	7.149,	6.759)
m2= c(3.869,	5.559,	4.969,	4.449,	6.529,	7.609,	6.889,	4.589,	5.739,	5.139)
boxplot(m1,m2,names=c("Muestra1","Muestra 2"), col=c("lightblue","magenta")) 
# La mediana de la muestra V es mayor a la de D7

#CONCLUSIÓN: NUESTRO MEJOR MODELO ES EL V



