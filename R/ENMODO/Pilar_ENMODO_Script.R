setwd("D:/Thesis/Scripting/R/CaseStudy_Pilar")

enmodo_viajes_origenpilar <- read.csv("enmodo_viajes_origenpilar.csv", header=TRUE)
destino_partido <- enmodo_viajes_origenpilar$TT_PARTIDO_DESTINO_FULL
summary(destino_partido)
