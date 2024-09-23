require (data.table)
setwd("/home/gcasabalvallejo/buckets/b1/exp/HT2810")
dataset = fread("~/buckets/b1/exp/HT2810/grid_search.txt")
tablita = dataset [ , mean(ganancia), list(cp,minsplit,minbucket, maxdepth)]
fwrite(tablita, file = "~/buckets/b1/exp/HT2810/AGRUPADOS.TXT")

#NOTAS DE TABLA:
# CON CP >  0.1, GANO CERO
# CON CP < 0 Y MAXDEPTH > 10, LA GANANCIA ES BAJA
# CON CP < 0 Y MAXDEPTH < 4, LA GANANCIA ES BAJA
#CON CP < 0, 6 <= MAXDEPTH <= 8 Y MINBUCKET > 10, GANANCIA ES BUENA