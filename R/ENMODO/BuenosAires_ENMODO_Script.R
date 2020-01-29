rm(list=ls())

setwd("D:/Thesis/R/ENMODO/csv_indexed")

hogares <- read.csv("hogares.csv", header=TRUE, na.string = TRUE, strip.white=TRUE)
    hogares[hogares=="Ns/Nc"] <- NA
    hogares[hogares=="No aplica"] <- NA

hogares_desc <- as.data.frame(stat.desc(hogares))


hogares_lmz <- read.csv("csv_lamatanza/lamatanza_hogares.csv", header=TRUE, na.string = TRUE)
hogares_lmz_vya <- read.csv("csv_lamatanza/villeros/lamatanza_hogares_villa_yes.csv", header=TRUE, na.string = TRUE)

hogares_plr <- read.csv("csv_pilar/pilar_hogares.csv", header=TRUE, na.string = TRUE)
hogares_plr_vya <- read.csv("csv_pilar/villeros/pilar_hogares_villa_yes.csv", header=TRUE, na.string = TRUE)

hogares_qlm <- read.csv("csv_quilmes/quilmes_hogares.csv", header=TRUE, na.string = TRUE)
hogares_qlm_vya <- read.csv("csv_quilmes/villeros/quilmes_hogares_villa_yes.csv", header=TRUE, na.string = TRUE)

hogares_vya <- read.csv("csv_villeros/hogares_villas_yes.csv", header=TRUE, na.string = TRUE)



summary(hogares_lmz)
sd(hogares_lmz$CANPER)



















etapas <- read.csv("etapas.csv", header=TRUE, na.string = TRUE, strip.white=TRUE)
    etapas[etapas=="Ns/Nc"] <- NA
    etapas[etapas=="No Aplica"] <- NA
stat.desc(etapas)

etapas_lmz <- read.csv("csv_lamatanza/lamatanza_etapas.csv", header=TRUE, na.string = TRUE)
    etapas_lmz[etapas_lmz=="Ns/Nc"] <- NA
    etapas_lmz[etapas_lmz=="No aplica"] <- NA

etapas_lmz_vya <- read.csv("csv_lamatanza/villeros/lamatanza_etapas_villa_yes.csv", header=TRUE, na.string = TRUE)
    etapas_lmz_vya[etapas_lmz_vya=="Ns/Nc"] <- NA
    etapas_lmz_vya[etapas_lmz_vya=="No aplica"] <- NA

etapas_plr <- read.csv("csv_pilar/pilar_etapas.csv", header=TRUE, na.string = TRUE)
    etapas_plr[etapas_plr=="Ns/Nc"] <- NA
    etapas_plr[etapas_plr=="No aplica"] <- NA

etapas_plr_vya <- read.csv("csv_pilar/villeros/pilar_etapas_villa_yes.csv", header=TRUE, na.string = TRUE)
    etapas_plr_vya[etapas_plr_vya=="Ns/Nc"] <- NA
    etapas_plr_vya[etapas_plr_vya=="No aplica"] <- NA

etapas_qlm <- read.csv("csv_quilmes/quilmes_etapas.csv", header=TRUE, na.string = TRUE)
    etapas_qlm[etapas_qlm=="Ns/Nc"] <- NA
    etapas_qlm[etapas_qlm=="No aplica"] <- NA

etapas_qlm_qlm_vya <- read.csv("csv_quilmes/villeros/quilmes_etapas_qlm_villa_yes.csv", header=TRUE, na.string = TRUE)
    etapas_qlm_vya[etapas_qlm_vya=="Ns/Nc"] <- NA
    etapas_qlm_vya[etapas_qlm_vya=="No aplica"] <- NA

etapas_vya <- read.csv("csv_villeros/etapas_villas_yes.csv", header=TRUE, na.string = TRUE)
    etapas_vya[etapas_vya=="Ns/Nc"] <- NA
    etapas_vya[etapas_vya=="No aplica"] <- NA

stat.desc(etapas, na.rm=TRUE)
help(stat.desc)
