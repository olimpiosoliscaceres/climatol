library(climatol) # cargar las funciones del paquete
setwd("C:/AppServ/GIT/CLIMATOL/CODIGO") #directorio del trabajo
#source("depurdat.R")
########## ahora usaremos nuestros datos ###############

#1. -Generar archivos de entrada 
dat <-as.matrix(read.table(file='dato-d_2012-2016.csv',header=TRUE, sep=';'))
write(dat,'dato-d_2012-2016.dat')
#daily2climatol('esta.txt',stcol = 1:6,datcol = c(1:3,4),varcli ="dato",anyi = 2012,anyf = 2016,mindat = 365,sep = ",", na.strings = 'NA',header = T )

#daily2climatol(stfile, stcol=1:6, datcol=1:4, varcli,anyi=NA, anyf=NA, mindat=365, sep='', dec='.', na.strings='NA',header=FALSE)
  
rm(dat) #borrar los datos cargados en memoria

#2.- Análisis exploratorio diario*
#Rellena datos solamente y genera graficos exploratorios

#nm=0 indica que son datos diarios
#std=2 que se hara una normalizacion por proporciones
#ini='2012-01-01' indica la fecha inicial (unicamente a efectos de rotular el eje temporal en los gr?ficos)

#homogen <- function(varcli, anyi, anyf, suf=NA, nm=NA, nref=c(10,10,4), std=3,
#                    swa=NA, ndec=1, dz.max=5, dz.min=-dz.max, wd=c(0,0,100), snht1=25, snht2=snht1,
#                    tol=.02, maxdif=NA, mxdif=maxdif, maxite=999, force=FALSE, wz=.001, trf=0,
#                    mndat=NA, gp=3, ini=NA, na.strings="NA", vmin=NA, vmax=NA, nclust=100,
#                    cutlev=NA, grdcol=grey(.4), mapcol=grey(.4), hires=TRUE, expl=FALSE,
#                    metad=FALSE, sufbrk='m', tinc=NA, tz='UTC', cex=1.2, verb=TRUE) 
#  
homogen('dato-d',2012,2016,nm=0,std=3,expl=TRUE,ini='2012-01-01')
#homogen('dato-d', 2012, 2016, expl=TRUE)


#7.- Cargar resultados de la homogeneizacion (crea en memoia: est.c)
load("dato-d_2012-2016.rda")

#8.- Resúmenes estadísticos
View(est.c)
#	    pod=% de datos originales
#      	    ios=Numero de estación#
#	    ope=
#               0->Finaliza con un dato claculado
#               1->Finaliza con un dato original
#	   snht=Prueba de homogeneidad
#	   rmse=Error cuadrático medio

#          Para evaluar:
#          mayor % de datos originales,menor error cuadratico medio, menor snht

#9.- Series Homogeneizadas
#Extrae los datos rellenos de datos diarios
dahstat('dato-d',2012,2016,stat='series')
########################################################
#Homogenized values written to dato-d_1964-2016_series.csv,
#  with flags in dato-d_1964-2016_flags.csv:
#  0: Observed data
#  1: Missing data (filled in)
#  2: Corrected data
