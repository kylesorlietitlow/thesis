rm(list=ls())
setwd("~/Documents/Thesis/Data")

library(ggplot2)
library(ggridges)
library(rsconnect)
library(sf)
library(tmap)

options(max.print=10000)

gdb_adm0 <- "Data_ADM0_Argentina.gdb/"
gdb_adm1 <- "Data_ADM1_BuenosAiresProvince.gdb/"
gdb_adm2 <- "Data_ADM2_AMBA.gdb/"
gdb_adm3 <- "Data_ADM3_3CaseStudies.gdb/"
gdb_thesis <- "Thesis.gdb/"
output_dsn = "GEOJSON"

## BOXPLOTS =================================================================================================
data_box <- read.csv("agba30_times_boxplots.csv")

#Sets the margins (BOT, LEFT, TOP, RIGHT)
par(mar=c(5,15,3,1),
    adj=0.5,
    pty="s",
    cex=0.9
    )

boxplot(MINUTES ~ DEPTO_RANK, 
        data = data_box, 
        #varwidth = TRUE,
        #width=5,
        las = 2,
        boxwex = 0.6,
        #ylim = c(0, 300), 
        main = "Travel times from radios in study departments",
        xlab = "Estimated travel times, in minutes",
        show.names = TRUE,
        
        ##JUST DESTINATIONS
        #col = c("lightblue1"),
        #at = c(1:3,5,7:9,11:13),
        #names = unique(data_box$DESTINATION),
        #ylab = "Destinations",
        
        ##JUST DEPTOS
        col = c("wheat1", "orange", "darkorange2"),
        names = unique(data_box$DEPTO),
        ylab = "Departments",
        
        ##JUST RADIOS
        #col = c("lightpink", "khaki1", "palegreen"),
        #names = unique(data_box$CLASS),
        #ylab = "Radios, by overlap with asentamiento",
        
        ##DESTINATIONS BY DEPTO (DEPTO_RANK*DEST_RANK)
        #col = c("wheat1", "orange", "darkorange2"),
        #names = c("","Dept. CBD","","","Any \nDept. \nCBD","","","DEST3","","","DEST4","","","DEST5","","","DEST6","","","DEST7","","","DEST8","","","DEST9","","","DEST10",""),
        #ylab = "Radios, by department and destination",
        #at = c(1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39),
        
        ##DESTINATIONS BY OVERLAP (CLASS_RANK*DEST_RANK)
        #col = c("lightpink", "khaki1", "palegreen"),
        #names = c("","DEST1","","","DEST2","","","DEST3","","","DEST4","","","DEST5","","","DEST6","","","DEST7","","","DEST8","","","DEST9","","","DEST10",""),
        #ylab = "Radios, by overlap-category and destination",
        #at = c(1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39),
        
        ##DESTINATIONS BY DEPTO, OVERLAP, AND DEST (CLASS_RANK*DEPTO_RANK*DEST_RANK)
        #col = c("lightpink", "khaki1", "palegreen"),
        #names = NA,
        #border = c("wheat1", "orange", "darkorange2"),
        #ylap = "Radios, by department, overlap, and destination",
        #at = c(1:30, 32:61, 63:92),
        
        #DEFAULT
        #col = c("lightblue1"),
        #names = NA,
        border = c("gray30"),
        
        horizontal = TRUE)

###GGRIDGES ===============================================================================================
ggplot(data = data_box, aes(x = data_box$DEPTO_RANK, y = data_box$MINUTES)) + 
  geom_density_ridges()

data_bar <- read.csv("agba30_times_barcharts.csv")

barplot(data_bar$trvtime_cbd_bsas,
        main = "Travel times, in minutes, to Buenos Aires' CBD")


##AGBA with all 30 departments =============================================================================
#amba30 <- st_read("GEOJSON/admin_adm2_amba30.geojson")

layer <- st_read(dsn=gdb_thesis, layer = "Study3_Origins_Radios_MeanCenter_withINDEC")
#layer <- layer[adm2_amba30,]
layer <- st_transform(layer, 4326)
geojson <- "origin_radio_n3_tt_all_withINDEC_TTscaled.geojson"

st_write(layer, 
         dsn = paste("GEOJSON",geojson,sep="/"), 
         layer = geojson, 
         driver = "GeoJSON")

tmap_mode("view")
#tmap_mode("plot")

tm_shape(adm2_amba30) + 
  tm_polygons(col = "gray", border.col = "dark gray") +
tm_shape(layer) + 
#  tm_polygons(alpha=0.6, col = "cyan")
   tm_symbols(col="blue", alpha=0.25, size = 0.10)
#  tm_lines(col="blue", alpha=0.25)



## MAP WITH ALL LAYERS =====================================================================================
