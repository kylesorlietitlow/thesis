setwd("~/Desktop")

techo_raw <- read.csv("TECHO_Asentamientos_Datos_Completos_2016_AMBAINDEC.csv", header=TRUE)
techo <- read.csv("TECHO_Asentamientos_Datos_Completos_2016_AMBAINDEC.csv", header=TRUE)



techo_raw_summary <- as.data.frame(summary(techo_raw))
    write.csv(techo_raw_summary, "techo_raw_summary.csv")
    
count(techo_raw$inundaciones)

techo_lamatanza <- techo_raw[ which(techo_raw$departamento=='La Matanza'),]
techo_lamatanza_summary <- as.data.frame(summary(techo_lamatanza))
    write.csv(techo_lamatanza_summary, "techo_lamatanza_summary.csv")

techo_pilar <- techo_raw[ which(techo_raw$departamento=='Pilar'),]
techo_pilar_summary <- as.data.frame(summary(techo_pilar))
    write.csv(techo_pilar_summary, "techo_pilar_summary.csv")

techo_quilmes <- techo_raw[ which(techo_raw$departamento=='Quilmes'),]
techo_quilmes_summary <- as.data.frame(summary(techo_quilmes))
    write.csv(techo_quilmes_summary, "techo_quilmes_summary.csv")

