#Clear the list
rm(list=ls())

setwd("D:/Thesis/R/CaseStudy_LaMatanza")

library(gmapsdistance)

#Set the API key connected to the kylesorlietitlow@gmail.com account
set.api.key("AIzaSyAvEqp54eWyxMIWKNfjh8Mt0rbSI5o9vWU")

#Set the API key connected to the kyletitlow@gmail.com account (PLR)
set.api.key("AIzaSyCZ3rV6mM-Iw9BZls_GI8oUzG7eqAPBR6I")

#Set the API key connected to the titlowsorliefamily@gmail.com account (QMS)
set.api.key("AIzaSyDTxaiC2XjwXQVeUqUU0aYR7La5sw1hIQI")

#Work departure time is 7:00:00 AM Buenos Aires time
dep_time_work <- "10:00:00"

#Health departure time is 10:30:00 AM Buenos Aires time
dep_time_health  <- "13:30:00"

#School departure time is 12:00:00 PM Buenos Aires time
dep_time_school <- "15:00:00"

#Remember to set the date for the subsequent WEDNESDAY; run this script before running any GMAPS
dep_date_nextwed <- "2018-03-07"

#Import CSV containing YX origin data for all radios
  orig_all <- read.csv("origins_radios_all.csv", header=TRUE)
     yx_org_1 <- as.vector(orig_all[c(1:25),c(4)], mode="character")
     yx_org_2 <- as.vector(orig_all[c(26:50),c(4)], mode="character")
     yx_org_3 <- as.vector(orig_all[c(51:75),c(4)], mode="character")
     yx_org_4 <- as.vector(orig_all[c(76:100),c(4)], mode="character")
     yx_org_5 <- as.vector(orig_all[c(101:120),c(4)], mode="character")
      
#------------------------------------------------------------------------------------------------      
#Import CSV containing YX destination data for Buenos Aires' central CBD (1)
  dest_cbd_bsas <- read.csv("destinations_cbd_buenosaires.csv", header=TRUE)
    yx_dest_cbd_bsas <- dest_cbd_bsas$YX_ORIGIN
    

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_cbdbs_tran7am = gmapsdistance(origin = yx_org_1,
                                            destination = yx_dest_cbd_bsas, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_default)
od_orig1_cbdbs_tran7am_time <- od_orig1_cbdbs_tran7am$Time
    colnames(od_orig1_cbdbs_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_bsas")
od_orig1_cbdbs_tran7am_dist <- od_orig1_cbdbs_tran7am$Distance
    colnames(od_orig1_cbdbs_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_bsas")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig2_cbdbs_tran7am = gmapsdistance(origin = yx_org_2, 
                                        destination = yx_dest_cbd_bsas, 
                                        mode="transit", 
                                        dep_date=dep_date_nextwed, 
                                        dep_time=dep_time_default)

od_orig2_cbdbs_tran7am_time <- od_orig2_cbdbs_tran7am$Time
    colnames(od_orig2_cbdbs_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_bsas")
od_orig2_cbdbs_tran7am_dist <- od_orig2_cbdbs_tran7am$Distance
    colnames(od_orig2_cbdbs_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_bsas")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig3_cbdbs_tran7am = gmapsdistance(origin = yx_org_3, 
                                        destination = yx_dest_cbd_bsas, 
                                        mode="transit", 
                                        dep_date=dep_date_nextwed, 
                                        dep_time=dep_time_default)

od_orig3_cbdbs_tran7am_time <- od_orig3_cbdbs_tran7am$Time
    colnames(od_orig3_cbdbs_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_bsas")
od_orig3_cbdbs_tran7am_dist <- od_orig3_cbdbs_tran7am$Time
    colnames(od_orig3_cbdbs_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_bsas")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig4_cbdbs_tran7am = gmapsdistance(origin = yx_org_4, 
                                        destination = yx_dest_cbd_bsas, 
                                        mode="transit", 
                                        dep_date=dep_date_nextwed, 
                                        dep_time=dep_time_default)

od_orig4_cbdbs_tran7am_time <- od_orig4_cbdbs_tran7am$Time
    colnames(od_orig4_cbdbs_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_bsas")
od_orig4_cbdbs_tran7am_dist <- od_orig4_cbdbs_tran7am$Distance
    colnames(od_orig4_cbdbs_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_bsas")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig5_cbdbs_tran7am = gmapsdistance(origin = yx_org_5, 
                                        destination = yx_dest_cbd_bsas, 
                                        mode="transit", 
                                        dep_date=dep_date_nextwed, 
                                        dep_time=dep_time_default)

od_orig5_cbdbs_tran7am_time <- od_orig5_cbdbs_tran7am$Time
    colnames(od_orig5_cbdbs_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_bsas")
od_orig5_cbdbs_tran7am_dist <- od_orig5_cbdbs_tran7am$Distance      
    colnames(od_orig5_cbdbs_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_bsas")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Join/append the different tables to each other and then join to the original CSV

tt_cbdbs_1to2 <- rbind(od_orig1_cbdbs_tran7am_time, od_orig2_cbdbs_tran7am_time)
tt_cbdbs_1to3 <- rbind(tt_cbdbs_1to2, od_orig3_cbdbs_tran7am_time)
tt_cbdbs_1to4 <- rbind(tt_cbdbs_1to3, od_orig4_cbdbs_tran7am_time)
tt_cbdbs_1to5 <- rbind(tt_cbdbs_1to4, od_orig5_cbdbs_tran7am_time)

#Create a column in the table that expresses this time variable in minutes    
tt_cbdbs_1to5$trvtime_cbd_bsas <- (tt_cbdbs_1to5$trvtime_cbd_bsas/60)

write.csv(tt_cbdbs_1to5, file="origins_radios_all_tt_cbdbs_tran0700.csv")  

  #Join/append the different tables to each other and then join to the original CSV
dt_cbdbs_1to2 <- rbind(od_orig1_cbdbs_tran7am_dist, od_orig2_cbdbs_tran7am_dist)
dt_cbdbs_1to3 <- rbind(dt_cbdbs_1to2, od_orig3_cbdbs_tran7am_dist)
dt_cbdbs_1to4 <- rbind(dt_cbdbs_1to3, od_orig4_cbdbs_tran7am_dist)
dt_cbdbs_1to5 <- rbind(dt_cbdbs_1to4, od_orig5_cbdbs_tran7am_dist)

write.csv(dt_cbdbs_1to5, file="origins_radios_all_dt_cbdbs_tran0700.csv")  

#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's central CBD (1)
dest_cbd_local <- read.csv("destinations_cbd_lamatanza.csv", header=TRUE)
yx_dest_cbd_local <- dest_cbd_lmtz$YX_ORIGIN

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_cbdlc_tran7am = gmapsdistance(origin = yx_org_1,
                                       destination = yx_dest_cbd_local, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_default)
od_orig1_cbdlc_tran7am_time <- od_orig1_cbdlc_tran7am$Time
colnames(od_orig1_cbdlc_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_local")
od_orig1_cbdlc_tran7am_dist <- od_orig1_cbdlc_tran7am$Distance
colnames(od_orig1_cbdlc_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_local")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig2_cbdlc_tran7am = gmapsdistance(origin = yx_org_2, 
                                       destination = yx_dest_cbd_local, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_default)

od_orig2_cbdlc_tran7am_time <- od_orig2_cbdlc_tran7am$Time
colnames(od_orig2_cbdlc_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_local")
od_orig2_cbdlc_tran7am_dist <- od_orig2_cbdlc_tran7am$Distance
colnames(od_orig2_cbdlc_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_local")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig3_cbdlc_tran7am = gmapsdistance(origin = yx_org_3, 
                                       destination = yx_dest_cbd_local, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_default)

od_orig3_cbdlc_tran7am_time <- od_orig3_cbdlc_tran7am$Time
colnames(od_orig3_cbdlc_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_local")
od_orig3_cbdlc_tran7am_dist <- od_orig3_cbdlc_tran7am$Time
colnames(od_orig3_cbdlc_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_local")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig4_cbdlc_tran7am = gmapsdistance(origin = yx_org_4, 
                                       destination = yx_dest_cbd_local, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_default)

od_orig4_cbdlc_tran7am_time <- od_orig4_cbdlc_tran7am$Time
colnames(od_orig4_cbdlc_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_local")
od_orig4_cbdlc_tran7am_dist <- od_orig4_cbdlc_tran7am$Distance
colnames(od_orig4_cbdlc_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_local")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig5_cbdlc_tran7am = gmapsdistance(origin = yx_org_5, 
                                       destination = yx_dest_cbd_local, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_default)

od_orig5_cbdlc_tran7am_time <- od_orig5_cbdlc_tran7am$Time
colnames(od_orig5_cbdlc_tran7am_time) <- c("YX_ORIGIN", "trvtime_cbd_local")
od_orig5_cbdlc_tran7am_dist <- od_orig5_cbdlc_tran7am$Distance      
colnames(od_orig5_cbdlc_tran7am_dist) <- c("YX_ORIGIN", "trvdist_cbd_local")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Join/append the different tables to each other and then join to the original CSV

tt_cbdlc_1to2 <- rbind(od_orig1_cbdlc_tran7am_time, od_orig2_cbdlc_tran7am_time)
tt_cbdlc_1to3 <- rbind(tt_cbdlc_1to2, od_orig3_cbdlc_tran7am_time)
tt_cbdlc_1to4 <- rbind(tt_cbdlc_1to3, od_orig4_cbdlc_tran7am_time)
tt_cbdlc_1to5 <- rbind(tt_cbdlc_1to4, od_orig5_cbdlc_tran7am_time)

#Create a column in the table that expresses this time variable in minutes    
tt_cbdlc_1to5$trvtime_cbd_local <- (tt_cbdlc_1to5$trvtime_cbd_local/60)

write.csv(tt_cbdlc_1to5, file="origins_radios_all_tt_cbdlc_tran0700.csv")  

#Join/append the different tables to each other and then join to the original CSV
dt_cbdlc_1to2 <- rbind(od_orig1_cbdlc_tran7am_dist, od_orig2_cbdlc_tran7am_dist)
dt_cbdlc_1to3 <- rbind(dt_cbdlc_1to2, od_orig3_cbdlc_tran7am_dist)
dt_cbdlc_1to4 <- rbind(dt_cbdlc_1to3, od_orig4_cbdlc_tran7am_dist)
dt_cbdlc_1to5 <- rbind(dt_cbdlc_1to4, od_orig5_cbdlc_tran7am_dist)

write.csv(dt_cbdlc_1to5, file="origins_radios_all_dt_cbdlc_tran0700.csv")

#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's proximate railroad stations (1)
  dest_rail <- read.csv("destinations_railroadstations_near.csv", header=TRUE)
    yx_dest_rail1 <- as.vector(dest_rail[c(1:25),c(17)], mode="character")
    yx_dest_rail2 <- as.vector(dest_rail[c(26:42),c(17)], mode="character")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
#Performs Google Distance Matrix API Request
od_orig1_rail1_tran7am = gmapsdistance(origin = yx_org_1,
                                           destination = yx_dest_rail1, 
                                           mode="transit", 
                                           dep_date=dep_date_nextwed, 
                                           dep_time=dep_time_work)

od_orig1_rail2_tran7am = gmapsdistance(origin = yx_org_1,
                                           destination = yx_dest_rail2, 
                                           mode="transit", 
                                           dep_date=dep_date_nextwed, 
                                           dep_time=dep_time_work)





#Merges the two rail distances and exports that as a CSV
od_orig1_rail1_tran7am_time <- od_orig1_rail1_tran7am$Time
od_orig1_rail2_tran7am_time <- od_orig1_rail2_tran7am$Time
  od_orig1_rail_tran7am_time_all <- merge(od_orig1_rail1_tran7am_time, 
                                          od_orig1_rail2_tran7am_time)
write.csv (od_orig1_rail_tran7am_time_all, "googletransit_od_orig1_rail_tran7am_time_all.csv")
  
  
od_orig1_rail1_tran7am_dist <- od_orig1_rail1_tran7am$Distance
od_orig1_rail2_tran7am_dist <- od_orig1_rail2_tran7am$Distance
  od_orig1_rail_tran7am_dist_all <- merge(od_orig1_rail1_tran7am_dist, 
                                          od_orig1_rail2_tran7am_dist)
write.csv (od_orig1_rail_tran7am_dist_all, "googletransit_od_orig1_rail1_tran7am_dist_all.csv")






  
#Finds the minimum value for each origin
od_orig1_rail_tran7am_time_all$Minimum <- apply(od_orig1_rail_tran7am_time_all[c(1:25),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig1_rail_tran7am_time <- od_orig1_rail_tran7am_time_all[c(1:25),c(1, 44)]
  colnames(od_orig1_rail_tran7am_time) <- c("YX_ORIGIN", "trvtime_rail_near")
  
    
od_orig1_rail_tran7am_dist_all$Minimum <- apply(od_orig1_rail_tran7am_dist_all[c(1:25),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig1_rail_tran7am_dist <- od_orig1_rail_tran7am_dist_all[c(1:25),c(1, 44)]
  colnames(od_orig1_rail_tran7am_dist) <- c("YX_ORIGIN", "trvdist_rail_near")

    
    
    
    
    
    
    
    
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig2_rail1_tran7am = gmapsdistance(origin = yx_org_2,
                                           destination = yx_dest_rail1, 
                                           mode="transit", 
                                           dep_date=dep_date_nextwed, 
                                           dep_time=dep_time_work)
    
od_orig2_rail2_tran7am = gmapsdistance(origin = yx_org_2,
                                           destination = yx_dest_rail2, 
                                           mode="transit", 
                                           dep_date=dep_date_nextwed, 
                                           dep_time=dep_time_work)



#Merges two rail datasets and then selects a minimum value
od_orig2_rail1_tran7am_time <- od_orig2_rail1_tran7am$Time
od_orig2_rail2_tran7am_time <- od_orig2_rail2_tran7am$Time
    od_orig2_rail_tran7am_time_all <- merge(od_orig2_rail1_tran7am_time, 
                                        od_orig2_rail2_tran7am_time)
write.csv (od_orig2_rail_tran7am_time_all, "googletransit_od_orig2_rail_tran7am_time_all.csv")


od_orig2_rail1_tran7am_dist <- od_orig2_rail1_tran7am$Distance
od_orig2_rail2_tran7am_dist <- od_orig2_rail2_tran7am$Distance
    od_orig2_rail_tran7am_dist_all <- merge(od_orig2_rail1_tran7am_dist, 
                                        od_orig2_rail2_tran7am_dist)
write.csv (od_orig2_rail_tran7am_dist_all, "googletransit_od_orig2_rail1_tran7am_dist_all.csv")







#Finds the minimum value for each origin
od_orig2_rail_tran7am_time_all$Minimum <- apply(od_orig2_rail_tran7am_time_all[c(1:25),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig2_rail_tran7am_time <- od_orig2_rail_tran7am_time_all[c(1:25),c(1, 44)]
colnames(od_orig2_rail_tran7am_time) <- c("YX_ORIGIN", "trvtime_rail_near")


od_orig2_rail_tran7am_dist_all$Minimum <- apply(od_orig2_rail_tran7am_dist_all[c(1:25),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig2_rail_tran7am_dist <- od_orig2_rail_tran7am_dist_all[c(1:25),c(1, 44)]
colnames(od_orig2_rail_tran7am_dist) <- c("YX_ORIGIN", "trvdist_rail_near")



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig3_rail1_tran7am = gmapsdistance(origin = yx_org_3,
                                       destination = yx_dest_rail1, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_work)

od_orig3_rail2_tran7am = gmapsdistance(origin = yx_org_3,
                                       destination = yx_dest_rail2, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_work)





#Merges two rail datasets and then selects a minimum value
od_orig3_rail1_tran7am_time <- od_orig3_rail1_tran7am$Time
od_orig3_rail2_tran7am_time <- od_orig3_rail2_tran7am$Time
  od_orig3_rail_tran7am_time_all <- merge(od_orig3_rail1_tran7am_time, 
                                        od_orig3_rail2_tran7am_time)
write.csv (od_orig3_rail_tran7am_time_all, "googletransit_od_orig3_rail_tran7am_time_all.csv")


od_orig3_rail1_tran7am_dist <- od_orig3_rail1_tran7am$Distance
od_orig3_rail2_tran7am_dist <- od_orig3_rail2_tran7am$Distance
  od_orig3_rail_tran7am_dist_all <- merge(od_orig3_rail1_tran7am_dist, 
                                        od_orig3_rail2_tran7am_dist)
write.csv (od_orig3_rail_tran7am_dist_all, "googletransit_od_orig3_rail1_tran7am_dist_all.csv")






#Finds the minimum value for each origin
od_orig3_rail_tran7am_time_all$Minimum <- apply(od_orig3_rail_tran7am_time_all[c(1:25),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig3_rail_tran7am_time <- od_orig3_rail_tran7am_time_all[c(1:25),c(1, 44)]
colnames(od_orig3_rail_tran7am_time) <- c("YX_ORIGIN", "trvtime_rail_near")


od_orig3_rail_tran7am_dist_all$Minimum <- apply(od_orig3_rail_tran7am_dist_all[c(1:25),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig3_rail_tran7am_dist <- od_orig3_rail_tran7am_dist_all[c(1:25),c(1, 44)]
colnames(od_orig3_rail_tran7am_dist) <- c("YX_ORIGIN", "trvdist_rail_near")




#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig4_rail1_tran7am = gmapsdistance(origin = yx_org_4,
                                       destination = yx_dest_rail1, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_work)

od_orig4_rail2_tran7am = gmapsdistance(origin = yx_org_4,
                                       destination = yx_dest_rail2, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_work)




#Merges two rail datasets and then selects a minimum value
od_orig4_rail1_tran7am_time <- od_orig4_rail1_tran7am$Time
od_orig4_rail2_tran7am_time <- od_orig4_rail2_tran7am$Time
  od_orig4_rail_tran7am_time_all <- merge(od_orig4_rail1_tran7am_time, 
                                        od_orig4_rail2_tran7am_time)
write.csv (od_orig4_rail_tran7am_time_all, "googletransit_od_orig4_rail_tran7am_time_all.csv")


od_orig4_rail1_tran7am_dist <- od_orig4_rail1_tran7am$Distance
od_orig4_rail2_tran7am_dist <- od_orig4_rail2_tran7am$Distance
  od_orig4_rail_tran7am_dist_all <- merge(od_orig4_rail1_tran7am_dist, 
                                        od_orig4_rail2_tran7am_dist)
write.csv (od_orig4_rail_tran7am_dist_all, "googletransit_od_orig4_rail1_tran7am_dist_all.csv")



#Finds the minimum value for each origin
od_orig4_rail_tran7am_time_all$Minimum <- apply(od_orig4_rail_tran7am_time_all[c(1:25),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig4_rail_tran7am_time <- od_orig4_rail_tran7am_time_all[c(1:25),c(1, 44)]
colnames(od_orig4_rail_tran7am_time) <- c("YX_ORIGIN", "trvtime_rail_near")


od_orig4_rail_tran7am_dist_all$Minimum <- apply(od_orig4_rail_tran7am_dist_all[c(1:25),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig4_rail_tran7am_dist <- od_orig4_rail_tran7am_dist_all[c(1:25),c(1, 44)]
colnames(od_orig4_rail_tran7am_dist) <- c("YX_ORIGIN", "trvdist_rail_near")



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
od_orig5_rail1_tran7am = gmapsdistance(origin = yx_org_5,
                                       destination = yx_dest_rail1, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_work)

od_orig5_rail2_tran7am = gmapsdistance(origin = yx_org_5,
                                       destination = yx_dest_rail2, 
                                       mode="transit", 
                                       dep_date=dep_date_nextwed, 
                                       dep_time=dep_time_work)


#Merges two rail datasets and then selects a minimum value
od_orig5_rail1_tran7am_time <- od_orig5_rail1_tran7am$Time
od_orig5_rail2_tran7am_time <- od_orig5_rail2_tran7am$Time
    od_orig5_rail_tran7am_time_all <- merge(od_orig5_rail1_tran7am_time, 
                                        od_orig5_rail2_tran7am_time)
write.csv (od_orig5_rail_tran7am_time_all, "googletransit_od_orig5_rail_tran7am_time_all.csv")


od_orig5_rail1_tran7am_dist <- od_orig5_rail1_tran7am$Distance
od_orig5_rail2_tran7am_dist <- od_orig5_rail2_tran7am$Distance
    od_orig5_rail_tran7am_dist_all <- merge(od_orig5_rail1_tran7am_dist, 
                                        od_orig5_rail2_tran7am_dist)
write.csv (od_orig5_rail_tran7am_dist_all, "googletransit_od_orig5_rail1_tran7am_dist_all.csv")




#Finds the minimum value for each origin
od_orig5_rail_tran7am_time_all$Minimum <- apply(od_orig5_rail_tran7am_time_all[c(1:20),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig5_rail_tran7am_time <- od_orig5_rail_tran7am_time_all[c(1:20),c(1, 44)]
colnames(od_orig5_rail_tran7am_time) <- c("YX_ORIGIN", "trvtime_rail_near")


od_orig5_rail_tran7am_dist_all$Minimum <- apply(od_orig5_rail_tran7am_dist_all[c(1:20),c(2:43)], 
                                                1, 
                                                FUN=min, 
                                                na.rm=TRUE)
od_orig5_rail_tran7am_dist <- od_orig5_rail_tran7am_dist_all[c(1:20),c(1, 44)]
colnames(od_orig5_rail_tran7am_dist) <- c("YX_ORIGIN", "trvdist_rail_near")


#Binds the 5 origin/destination tables together
od_orig_rail_tran7am_time <- rbind(od_orig1_rail_tran7am_time, 
                                   od_orig2_rail_tran7am_time,
                                   od_orig3_rail_tran7am_time,
                                   od_orig4_rail_tran7am_time,
                                   od_orig5_rail_tran7am_time)
write.csv (od_orig_rail_tran7am_time, "googletransit_od_orig_rail_tran7am_time.csv")

od_orig_rail_tran7am_dist <- rbind(od_orig1_rail_tran7am_dist, 
                                   od_orig2_rail_tran7am_dist,
                                   od_orig3_rail_tran7am_dist,
                                   od_orig4_rail_tran7am_dist,
                                   od_orig5_rail_tran7am_dist)
write.csv (od_orig_rail_tran7am_dist, "googletransit_od_orig_rail_tran7am_dist.csv")

#-----------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's neighboring CBD's (8)
dest_cbd_neigh <- read.csv("destinations_cbd_neighbors.csv", header=TRUE)
    yx_dest_cbdngh <- as.vector(dest_cbd_neigh[c(1:8),c(2)], mode="character")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_cbdngh_tran7am = gmapsdistance(origin = yx_org_1,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)
od_orig2_cbdngh_tran7am = gmapsdistance(origin = yx_org_2,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)
od_orig3_cbdngh_tran7am = gmapsdistance(origin = yx_org_3,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)
od_orig4_cbdngh_tran7am = gmapsdistance(origin = yx_org_4,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work) 
od_orig5_cbdngh_tran7am = gmapsdistance(origin = yx_org_5,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work) 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran7am_time <- od_orig1_cbdngh_tran7am$Time
od_orig2_cbdngh_tran7am_time <- od_orig2_cbdngh_tran7am$Time
od_orig3_cbdngh_tran7am_time <- od_orig3_cbdngh_tran7am$Time
od_orig4_cbdngh_tran7am_time <- od_orig4_cbdngh_tran7am$Time
od_orig5_cbdngh_tran7am_time <- od_orig5_cbdngh_tran7am$Time
od_orig1_cbdngh_tran7am_dist <- od_orig1_cbdngh_tran7am$Distance
od_orig2_cbdngh_tran7am_dist <- od_orig2_cbdngh_tran7am$Distance
od_orig3_cbdngh_tran7am_dist <- od_orig3_cbdngh_tran7am$Distance
od_orig4_cbdngh_tran7am_dist <- od_orig4_cbdngh_tran7am$Distance
od_orig5_cbdngh_tran7am_dist <- od_orig5_cbdngh_tran7am$Distance

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran7am_time$Minimum <- apply(od_orig1_cbdngh_tran7am_time[c(1:25),c(2:9)], 1, FUN=min, na.rm=TRUE)
od_orig2_cbdngh_tran7am_time$Minimum <- apply(od_orig2_cbdngh_tran7am_time[c(1:25),c(2:9)], 1, FUN=min, na.rm=TRUE)
od_orig3_cbdngh_tran7am_time$Minimum <- apply(od_orig3_cbdngh_tran7am_time[c(1:25),c(2:9)], 1, FUN=min, na.rm=TRUE)
od_orig4_cbdngh_tran7am_time$Minimum <- apply(od_orig4_cbdngh_tran7am_time[c(1:25),c(2:9)], 1, FUN=min, na.rm=TRUE)
od_orig5_cbdngh_tran7am_time$Minimum <- apply(od_orig5_cbdngh_tran7am_time[c(1:20),c(2:9)], 1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran7am_time_min <- od_orig1_cbdngh_tran7am_time[c(1:25),c(1, 10)]
od_orig2_cbdngh_tran7am_time_min <- od_orig2_cbdngh_tran7am_time[c(1:25),c(1, 10)]
od_orig3_cbdngh_tran7am_time_min <- od_orig3_cbdngh_tran7am_time[c(1:25),c(1, 10)]
od_orig4_cbdngh_tran7am_time_min <- od_orig4_cbdngh_tran7am_time[c(1:25),c(1, 10)]
od_orig5_cbdngh_tran7am_time_min <- od_orig5_cbdngh_tran7am_time[c(1:20),c(1, 10)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_cbdngh_tran7am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig2_cbdngh_tran7am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig3_cbdngh_tran7am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig4_cbdngh_tran7am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig5_cbdngh_tran7am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_cbdngh_tran7am_time <- rbind(od_orig1_cbdngh_tran7am_time_min, 
                                   od_orig2_cbdngh_tran7am_time_min,
                                   od_orig3_cbdngh_tran7am_time_min,
                                   od_orig4_cbdngh_tran7am_time_min,
                                   od_orig5_cbdngh_tran7am_time_min)
write.csv (od_orig_cbdngh_tran7am_time, "googletransit_od_orig_cbdngh_tran7am_time.csv")    

#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's kindergartens (148)
dest_ed_kinder <- read.csv("destinations_ed_provpub_kindergarten.csv", header=TRUE)
    yx_dest_edknd1 <- as.vector(dest_ed_kinder[c(1:25),c(28)], mode="character")
    yx_dest_edknd2 <- as.vector(dest_ed_kinder[c(26:50),c(28)], mode="character")
    yx_dest_edknd3 <- as.vector(dest_ed_kinder[c(51:75),c(28)], mode="character")
    yx_dest_edknd4 <- as.vector(dest_ed_kinder[c(76:100),c(28)], mode="character")
    yx_dest_edknd5 <- as.vector(dest_ed_kinder[c(101:125),c(28)], mode="character")
    yx_dest_edknd6 <- as.vector(dest_ed_kinder[c(126:148),c(28)], mode="character")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd6_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig2_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd6_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig3_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd6_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig4_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd6_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edknd6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig5_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edknd6_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edknd6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edknd1_tran1200pm_time <- od_orig1_edknd1_tran1200pm_all$Time
od_orig1_edknd2_tran1200pm_time <- od_orig1_edknd2_tran1200pm_all$Time
od_orig1_edknd3_tran1200pm_time <- od_orig1_edknd3_tran1200pm_all$Time
od_orig1_edknd4_tran1200pm_time <- od_orig1_edknd4_tran1200pm_all$Time
od_orig1_edknd5_tran1200pm_time <- od_orig1_edknd5_tran1200pm_all$Time
od_orig1_edknd6_tran1200pm_time <- od_orig1_edknd6_tran1200pm_all$Time

od_orig2_edknd1_tran1200pm_time <- od_orig2_edknd1_tran1200pm_all$Time
od_orig2_edknd2_tran1200pm_time <- od_orig2_edknd2_tran1200pm_all$Time
od_orig2_edknd3_tran1200pm_time <- od_orig2_edknd3_tran1200pm_all$Time
od_orig2_edknd4_tran1200pm_time <- od_orig2_edknd4_tran1200pm_all$Time
od_orig2_edknd5_tran1200pm_time <- od_orig2_edknd5_tran1200pm_all$Time
od_orig2_edknd6_tran1200pm_time <- od_orig2_edknd6_tran1200pm_all$Time

od_orig3_edknd1_tran1200pm_time <- od_orig3_edknd1_tran1200pm_all$Time
od_orig3_edknd2_tran1200pm_time <- od_orig3_edknd2_tran1200pm_all$Time
od_orig3_edknd3_tran1200pm_time <- od_orig3_edknd3_tran1200pm_all$Time
od_orig3_edknd4_tran1200pm_time <- od_orig3_edknd4_tran1200pm_all$Time
od_orig3_edknd5_tran1200pm_time <- od_orig3_edknd5_tran1200pm_all$Time
od_orig3_edknd6_tran1200pm_time <- od_orig3_edknd6_tran1200pm_all$Time

od_orig4_edknd1_tran1200pm_time <- od_orig4_edknd1_tran1200pm_all$Time
od_orig4_edknd2_tran1200pm_time <- od_orig4_edknd2_tran1200pm_all$Time
od_orig4_edknd3_tran1200pm_time <- od_orig4_edknd3_tran1200pm_all$Time
od_orig4_edknd4_tran1200pm_time <- od_orig4_edknd4_tran1200pm_all$Time
od_orig4_edknd5_tran1200pm_time <- od_orig4_edknd5_tran1200pm_all$Time
od_orig4_edknd6_tran1200pm_time <- od_orig4_edknd6_tran1200pm_all$Time

od_orig5_edknd1_tran1200pm_time <- od_orig5_edknd1_tran1200pm_all$Time
od_orig5_edknd2_tran1200pm_time <- od_orig5_edknd2_tran1200pm_all$Time
od_orig5_edknd3_tran1200pm_time <- od_orig5_edknd3_tran1200pm_all$Time
od_orig5_edknd4_tran1200pm_time <- od_orig5_edknd4_tran1200pm_all$Time
od_orig5_edknd5_tran1200pm_time <- od_orig5_edknd5_tran1200pm_all$Time
od_orig5_edknd6_tran1200pm_time <- od_orig5_edknd6_tran1200pm_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    temp_1a <- merge(od_orig1_edknd1_tran1200pm_time, od_orig1_edknd2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig1_edknd3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig1_edknd4_tran1200pm_time)
    temp_1d <- merge(temp_1c, od_orig1_edknd5_tran1200pm_time)
od_orig1_edknd_tran1200pm_time <- merge(temp_1d, od_orig1_edknd6_tran1200pm_time)

temp_1a <- merge(od_orig2_edknd1_tran1200pm_time, od_orig2_edknd2_tran1200pm_time)
temp_1b <- merge(temp_1a, od_orig2_edknd3_tran1200pm_time)
temp_1c <- merge(temp_1b, od_orig2_edknd4_tran1200pm_time)
temp_1d <- merge(temp_1c, od_orig2_edknd5_tran1200pm_time)
od_orig2_edknd_tran1200pm_time <- merge(temp_1d, od_orig2_edknd6_tran1200pm_time)

temp_1a <- merge(od_orig3_edknd1_tran1200pm_time, od_orig3_edknd2_tran1200pm_time)
temp_1b <- merge(temp_1a, od_orig3_edknd3_tran1200pm_time)
temp_1c <- merge(temp_1b, od_orig3_edknd4_tran1200pm_time)
temp_1d <- merge(temp_1c, od_orig3_edknd5_tran1200pm_time)
od_orig3_edknd_tran1200pm_time <- merge(temp_1d, od_orig3_edknd6_tran1200pm_time)

temp_1a <- merge(od_orig4_edknd1_tran1200pm_time, od_orig4_edknd2_tran1200pm_time)
temp_1b <- merge(temp_1a, od_orig4_edknd3_tran1200pm_time)
temp_1c <- merge(temp_1b, od_orig4_edknd4_tran1200pm_time)
temp_1d <- merge(temp_1c, od_orig4_edknd5_tran1200pm_time)
od_orig4_edknd_tran1200pm_time <- merge(temp_1d, od_orig4_edknd6_tran1200pm_time)

temp_1a <- merge(od_orig5_edknd1_tran1200pm_time, od_orig5_edknd2_tran1200pm_time)
temp_1b <- merge(temp_1a, od_orig5_edknd3_tran1200pm_time)
temp_1c <- merge(temp_1b, od_orig5_edknd4_tran1200pm_time)
temp_1d <- merge(temp_1c, od_orig5_edknd5_tran1200pm_time)
od_orig5_edknd_tran1200pm_time <- merge(temp_1d, od_orig5_edknd6_tran1200pm_time)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edknd_tran1200pm_time <- rbind(od_orig1_edknd_tran1200pm_time, 
                                       od_orig2_edknd_tran1200pm_time,
                                       od_orig3_edknd_tran1200pm_time,
                                       od_orig4_edknd_tran1200pm_time,
                                       od_orig5_edknd_tran1200pm_time)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_edknd_tran1200pm_time, "gmapsraw_od_orig_edknd_tran1200pm_time.csv")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edknd_tran1200pm_time$Minimum <- apply(od_orig_edknd_tran1200pm_time[ ,c(2:149)], 
                                                1, FUN=min, na.rm=TRUE) 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edknd_tran1200pm_time_min <- od_orig_edknd_tran1200pm_time[,c(1, 150)]    

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig_edknd_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edknd_min")   

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edknd_tran1200pm_time_min$trvtime_edknd_min <- (od_orig_edknd_tran1200pm_time_min$trvtime_edknd_min/60)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_edknd_tran1200pm_time_min, "googletransit_od_orig_edknd_tran1200pm_time.csv") 
    
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's primary schools (203)
dest_ed_prim <- read.csv("destinations_ed_provpub_primary.csv", header=TRUE)
    yx_dest_edprm1 <- as.vector(dest_ed_prim[c(1:25),c(28)], mode="character")
    yx_dest_edprm2 <- as.vector(dest_ed_prim[c(26:50),c(28)], mode="character")
    yx_dest_edprm3 <- as.vector(dest_ed_prim[c(51:75),c(28)], mode="character")
    yx_dest_edprm4 <- as.vector(dest_ed_prim[c(76:100),c(28)], mode="character")
    yx_dest_edprm5 <- as.vector(dest_ed_prim[c(101:125),c(28)], mode="character")
    yx_dest_edprm6 <- as.vector(dest_ed_prim[c(126:150),c(28)], mode="character")
    yx_dest_edprm7 <- as.vector(dest_ed_prim[c(151:175),c(28)], mode="character")
    yx_dest_edprm8 <- as.vector(dest_ed_prim[c(176:200),c(28)], mode="character")
    yx_dest_edprm9 <- as.vector(dest_ed_prim[c(201:203),c(28)], mode="character")

#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's secondary schools (199)
dest_ed_second <- read.csv("destinations_ed_provpub_secondary.csv", header=TRUE)
    yx_dest_edsec1 <- as.vector(dest_ed_second[c(1:25),c(28)], mode="character")
    yx_dest_edsec2 <- as.vector(dest_ed_second[c(26:50),c(28)], mode="character")
    yx_dest_edsec3 <- as.vector(dest_ed_second[c(51:75),c(28)], mode="character")
    yx_dest_edsec4 <- as.vector(dest_ed_second[c(76:100),c(28)], mode="character")
    yx_dest_edsec5 <- as.vector(dest_ed_second[c(101:125),c(28)], mode="character")
    yx_dest_edsec6 <- as.vector(dest_ed_second[c(126:150),c(28)], mode="character")
    yx_dest_edsec7 <- as.vector(dest_ed_second[c(151:175),c(28)], mode="character")
    yx_dest_edsec8 <- as.vector(dest_ed_second[c(176:199),c(28)], mode="character")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec5_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec6_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec7_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec7, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec8_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec8, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig2_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec5_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec6_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec7_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec7, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec8_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec8, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

od_orig3_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec5_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec6_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec7_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec7, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec8_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec8, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig4_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec5_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec6_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec7_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec7, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec8_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec8, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig5_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edsec5_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edsec5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edsec6_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edsec6, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edsec7_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edsec7, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig5_edsec8_tran1200pm_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_edsec8, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec1_tran1200pm_time <- od_orig1_edsec1_tran1200pm_all$Time
od_orig1_edsec2_tran1200pm_time <- od_orig1_edsec2_tran1200pm_all$Time
od_orig1_edsec3_tran1200pm_time <- od_orig1_edsec3_tran1200pm_all$Time
od_orig1_edsec4_tran1200pm_time <- od_orig1_edsec4_tran1200pm_all$Time
od_orig1_edsec5_tran1200pm_time <- od_orig1_edsec5_tran1200pm_all$Time
od_orig1_edsec6_tran1200pm_time <- od_orig1_edsec6_tran1200pm_all$Time
od_orig1_edsec7_tran1200pm_time <- od_orig1_edsec7_tran1200pm_all$Time
od_orig1_edsec8_tran1200pm_time <- od_orig1_edsec8_tran1200pm_all$Time

od_orig2_edsec1_tran1200pm_time <- od_orig2_edsec1_tran1200pm_all$Time
od_orig2_edsec2_tran1200pm_time <- od_orig2_edsec2_tran1200pm_all$Time
od_orig2_edsec3_tran1200pm_time <- od_orig2_edsec3_tran1200pm_all$Time
od_orig2_edsec4_tran1200pm_time <- od_orig2_edsec4_tran1200pm_all$Time
od_orig2_edsec5_tran1200pm_time <- od_orig2_edsec5_tran1200pm_all$Time
od_orig2_edsec6_tran1200pm_time <- od_orig2_edsec6_tran1200pm_all$Time
od_orig2_edsec7_tran1200pm_time <- od_orig2_edsec7_tran1200pm_all$Time
od_orig2_edsec8_tran1200pm_time <- od_orig2_edsec8_tran1200pm_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    temp_1a <- merge(od_orig1_edsec1_tran1200pm_time, od_orig1_edsec2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig1_edsec3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig1_edsec4_tran1200pm_time)
    temp_1d <- merge(temp_1c, od_orig1_edsec5_tran1200pm_time)
    temp_1e <- merge(temp_1d, od_orig1_edsec6_tran1200pm_time)
    temp_1f <- merge(temp_1e, od_orig1_edsec7_tran1200pm_time)
od_orig1_edsec_tran1200pm_time <- merge(temp_1f, od_orig1_edsec8_tran1200pm_time)

    temp_1a <- merge(od_orig2_edsec1_tran1200pm_time, od_orig2_edsec2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig2_edsec3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig2_edsec4_tran1200pm_time)
    temp_1d <- merge(temp_1c, od_orig2_edsec5_tran1200pm_time)
    temp_1e <- merge(temp_1d, od_orig2_edsec6_tran1200pm_time)
    temp_1f <- merge(temp_1e, od_orig2_edsec7_tran1200pm_time)
od_orig2_edsec_tran1200pm_time <- merge(temp_1f, od_orig2_edsec8_tran1200pm_time)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_edsec_tran1200pm_time, "gmapsraw_od_orig1_edsec_tran1200pm_time.csv") 
write.csv (od_orig2_edsec_tran1200pm_time, "gmapsraw_od_orig2_edsec_tran1200pm_time.csv")  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec_tran1200pm_time$Minimum <- apply(od_orig1_edsec_tran1200pm_time[ ,c(2:171)], 
                                                1, FUN=min, na.rm=TRUE)    
od_orig2_edsec_tran1200pm_time$Minimum <- apply(od_orig2_edsec_tran1200pm_time[ ,c(2:171)], 
                                                1, FUN=min, na.rm=TRUE) 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec_tran1200pm_time_min <- od_orig1_edsec_tran1200pm_time[,c(1, 62)]    
od_orig2_edsec_tran1200pm_time_min <- od_orig2_edsec_tran1200pm_time[,c(1, 62)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_min")    
colnames(od_orig2_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_min") 

    
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's public hospitals (19)
dest_health_hosp <- read.csv("destinations_health_fedpub_hosp.csv", header=TRUE)
    yx_dest_hsp <- as.vector(dest_health_hosp[c(1:19),c(11)], mode="character")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_hspt_tran7am_all = gmapsdistance(origin = yx_org_1,
                                            destination = yx_dest_hsp, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)
od_orig2_hspt_tran7am_all = gmapsdistance(origin = yx_org_2,
                                            destination = yx_dest_hsp, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)
od_orig3_hspt_tran7am_all = gmapsdistance(origin = yx_org_3,
                                            destination = yx_dest_hsp, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)
od_orig4_hspt_tran7am_all = gmapsdistance(origin = yx_org_4,
                                            destination = yx_dest_hsp, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health) 
od_orig5_hspt_tran7am_all = gmapsdistance(origin = yx_org_5,
                                            destination = yx_dest_hsp, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)     
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time <- od_orig1_hspt_tran7am_all$Time
od_orig2_hspt_tran1030am_time <- od_orig2_hspt_tran7am_all$Time
od_orig3_hspt_tran1030am_time <- od_orig3_hspt_tran7am_all$Time
od_orig4_hspt_tran1030am_time <- od_orig4_hspt_tran7am_all$Time
od_orig5_hspt_tran1030am_time <- od_orig5_hspt_tran7am_all$Time
od_orig1_hspt_tran1030am_dist <- od_orig1_hspt_tran7am_all$Distance
od_orig2_hspt_tran1030am_dist <- od_orig2_hspt_tran7am_all$Distance
od_orig3_hspt_tran1030am_dist <- od_orig3_hspt_tran7am_all$Distance
od_orig4_hspt_tran1030am_dist <- od_orig4_hspt_tran7am_all$Distance
od_orig5_hspt_tran1030am_dist <- od_orig5_hspt_tran7am_all$Distance

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time$Minimum <- apply(od_orig1_hspt_tran1030am_time[c(1:25),c(2:20)], 
                                            1, FUN=min, na.rm=TRUE)
od_orig2_hspt_tran1030am_time$Minimum <- apply(od_orig2_hspt_tran1030am_time[c(1:25),c(2:20)], 
                                            1, FUN=min, na.rm=TRUE)
od_orig3_hspt_tran1030am_time$Minimum <- apply(od_orig3_hspt_tran1030am_time[c(1:25),c(2:20)], 
                                            1, FUN=min, na.rm=TRUE)
od_orig4_hspt_tran1030am_time$Minimum <- apply(od_orig4_hspt_tran1030am_time[c(1:25),c(2:20)], 
                                            1, FUN=min, na.rm=TRUE)
od_orig5_hspt_tran1030am_time$Minimum <- apply(od_orig5_hspt_tran1030am_time[c(1:20),c(2:20)], 
                                            1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time_min <- od_orig1_hspt_tran1030am_time[c(1:25),c(1, 21)]
od_orig2_hspt_tran1030am_time_min <- od_orig2_hspt_tran1030am_time[c(1:25),c(1, 21)]
od_orig3_hspt_tran1030am_time_min <- od_orig3_hspt_tran1030am_time[c(1:25),c(1, 21)]
od_orig4_hspt_tran1030am_time_min <- od_orig4_hspt_tran1030am_time[c(1:25),c(1, 21)]
od_orig5_hspt_tran1030am_time_min <- od_orig5_hspt_tran1030am_time[c(1:20),c(1, 21)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig2_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig3_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig4_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig5_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_hspt_tran1030am_time <- rbind(od_orig1_hspt_tran1030am_time_min, 
                                   od_orig2_hspt_tran1030am_time_min,
                                   od_orig3_hspt_tran1030am_time_min,
                                   od_orig4_hspt_tran1030am_time_min,
                                   od_orig5_hspt_tran1030am_time_min)
write.csv (od_orig_hspt_tran1030am_time, "googletransit_od_orig_hspt_tran1030am_time.csv") 

#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's public diag/treatment centers (81)
dest_health_diagtrat <- read.csv("destinations_health_fedpub_diagtreat.csv", header=TRUE)
    yx_dest_dgntrt1 <- as.vector(dest_health_diagtrat[c(1:25),c(13)], mode="character")
    yx_dest_dgntrt2 <- as.vector(dest_health_diagtrat[c(26:50),c(13)], mode="character")
    yx_dest_dgntrt3 <- as.vector(dest_health_diagtrat[c(51:75),c(13)], mode="character")
    yx_dest_dgntrt4 <- as.vector(dest_health_diagtrat[c(76:81),c(13)], mode="character")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig1_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig1_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig1_dgntrt4_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

od_orig2_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig2_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig2_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig2_dgntrt4_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

od_orig3_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig3_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig3_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig3_dgntrt4_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

od_orig4_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig4_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig4_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig4_dgntrt4_tran1030am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_dgntrt4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

od_orig5_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig5_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig5_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig5_dgntrt4_tran1030am_all = gmapsdistance(origin = yx_org_5,destination = yx_dest_dgntrt4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_dgntrt1_tran1030am_time <- od_orig1_dgntrt1_tran1030am_all$Time
od_orig1_dgntrt2_tran1030am_time <- od_orig1_dgntrt2_tran1030am_all$Time
od_orig1_dgntrt3_tran1030am_time <- od_orig1_dgntrt3_tran1030am_all$Time
od_orig1_dgntrt4_tran1030am_time <- od_orig1_dgntrt4_tran1030am_all$Time

od_orig1_dgntrt_tran1030am_time <- merge(temp1b <- merge(temp1a <- merge(od_orig1_dgntrt1_tran1030am_time, 
                                                                         od_orig1_dgntrt2_tran1030am_time), 
                                                          od_orig1_dgntrt3_tran1030am_time), 
                                      od_orig1_dgntrt4_tran1030am_time)    

od_orig2_dgntrt1_tran1030am_time <- od_orig2_dgntrt1_tran1030am_all$Time
od_orig2_dgntrt2_tran1030am_time <- od_orig2_dgntrt2_tran1030am_all$Time
od_orig2_dgntrt3_tran1030am_time <- od_orig2_dgntrt3_tran1030am_all$Time
od_orig2_dgntrt4_tran1030am_time <- od_orig2_dgntrt4_tran1030am_all$Time

od_orig2_dgntrt_tran1030am_time <- merge(temp1b <- merge(temp1a <- merge(od_orig2_dgntrt1_tran1030am_time, 
                                                                         od_orig2_dgntrt2_tran1030am_time), 
                                                         od_orig2_dgntrt3_tran1030am_time), 
                                         od_orig2_dgntrt4_tran1030am_time)    


od_orig3_dgntrt1_tran1030am_time <- od_orig3_dgntrt1_tran1030am_all$Time
od_orig3_dgntrt2_tran1030am_time <- od_orig3_dgntrt2_tran1030am_all$Time
od_orig3_dgntrt3_tran1030am_time <- od_orig3_dgntrt3_tran1030am_all$Time
od_orig3_dgntrt4_tran1030am_time <- od_orig3_dgntrt4_tran1030am_all$Time

od_orig3_dgntrt_tran1030am_time <- merge(temp1b <- merge(temp1a <- merge(od_orig3_dgntrt1_tran1030am_time, 
                                                                         od_orig3_dgntrt2_tran1030am_time), 
                                                         od_orig3_dgntrt3_tran1030am_time), 
                                         od_orig3_dgntrt4_tran1030am_time)    


od_orig4_dgntrt1_tran1030am_time <- od_orig4_dgntrt1_tran1030am_all$Time
od_orig4_dgntrt2_tran1030am_time <- od_orig4_dgntrt2_tran1030am_all$Time
od_orig4_dgntrt3_tran1030am_time <- od_orig4_dgntrt3_tran1030am_all$Time
od_orig4_dgntrt4_tran1030am_time <- od_orig4_dgntrt4_tran1030am_all$Time

od_orig4_dgntrt_tran1030am_time <- merge(temp1b <- merge(temp1a <- merge(od_orig4_dgntrt1_tran1030am_time, 
                                                                         od_orig4_dgntrt2_tran1030am_time), 
                                                         od_orig4_dgntrt3_tran1030am_time), 
                                         od_orig4_dgntrt4_tran1030am_time)    


od_orig5_dgntrt1_tran1030am_time <- od_orig5_dgntrt1_tran1030am_all$Time
od_orig5_dgntrt2_tran1030am_time <- od_orig5_dgntrt2_tran1030am_all$Time
od_orig5_dgntrt3_tran1030am_time <- od_orig5_dgntrt3_tran1030am_all$Time
od_orig5_dgntrt4_tran1030am_time <- od_orig5_dgntrt4_tran1030am_all$Time

od_orig5_dgntrt_tran1030am_time <- merge(temp1b <- merge(temp1a <- merge(od_orig5_dgntrt1_tran1030am_time, 
                                                                         od_orig5_dgntrt2_tran1030am_time), 
                                                         od_orig5_dgntrt3_tran1030am_time), 
                                         od_orig5_dgntrt4_tran1030am_time)    


    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_dgntrt_tran1030am_time, "gmapsraw_od_orig1_dgntrt_tran1030am_time.csv") 
write.csv (od_orig2_dgntrt_tran1030am_time, "gmapsraw_od_orig2_dgntrt_tran1030am_time.csv")  
write.csv (od_orig3_dgntrt_tran1030am_time, "gmapsraw_od_orig3_dgntrt_tran1030am_time.csv")  
write.csv (od_orig4_dgntrt_tran1030am_time, "gmapsraw_od_orig4_dgntrt_tran1030am_time.csv")  
write.csv (od_orig5_dgntrt_tran1030am_time, "gmapsraw_od_orig5_dgntrt_tran1030am_time.csv")  
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_dgntrt_tran1030am_time$Minimum <- apply(od_orig1_dgntrt_tran1030am_time[c(1:25),c(2:82)], 
                                                 1, FUN=min, na.rm=TRUE)    
od_orig2_dgntrt_tran1030am_time$Minimum <- apply(od_orig2_dgntrt_tran1030am_time[c(1:25),c(2:82)], 
                                                 1, FUN=min, na.rm=TRUE)  
od_orig3_dgntrt_tran1030am_time$Minimum <- apply(od_orig3_dgntrt_tran1030am_time[c(1:25),c(2:82)], 
                                                 1, FUN=min, na.rm=TRUE)  
od_orig4_dgntrt_tran1030am_time$Minimum <- apply(od_orig4_dgntrt_tran1030am_time[c(1:25),c(2:82)], 
                                                 1, FUN=min, na.rm=TRUE)  
od_orig5_dgntrt_tran1030am_time$Minimum <- apply(od_orig5_dgntrt_tran1030am_time[c(1:20),c(2:82)], 
                                                 1, FUN=min, na.rm=TRUE)  
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_dgntrt_tran1030am_time_min <- od_orig1_dgntrt_tran1030am_time[c(1:25),c(1, 83)]    
od_orig2_dgntrt_tran1030am_time_min <- od_orig2_dgntrt_tran1030am_time[c(1:25),c(1, 83)]  
od_orig3_dgntrt_tran1030am_time_min <- od_orig3_dgntrt_tran1030am_time[c(1:25),c(1, 83)]  
od_orig4_dgntrt_tran1030am_time_min <- od_orig4_dgntrt_tran1030am_time[c(1:25),c(1, 83)]  
od_orig5_dgntrt_tran1030am_time_min <- od_orig5_dgntrt_tran1030am_time[c(1:20),c(1, 83)]  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")    
colnames(od_orig2_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")  
colnames(od_orig3_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")  
colnames(od_orig4_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")  
colnames(od_orig5_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")  

od_orig_dgntrt_tran1030am_time <- rbind(od_orig1_dgntrt_tran1030am_time_min, 
                                     od_orig2_dgntrt_tran1030am_time_min,
                                     od_orig3_dgntrt_tran1030am_time_min,
                                     od_orig4_dgntrt_tran1030am_time_min,
                                     od_orig5_dgntrt_tran1030am_time_min)

od_orig_dgntrt_tran1030am_time$trvtime_dgntrt_near <- (od_orig_dgntrt_tran1030am_time$trvtime_dgntrt_near/60)


write.csv (od_orig_dgntrt_tran1030am_time, "googletransit_od_orig_dgntrt_tran1030am_time.csv") 

    
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for La Matanza's UPAs (9)
dest_health_upa <- read.csv("destinations_health_provpub_upa.csv", header=TRUE)
    yx_dest_upa <- as.vector(dest_health_upa[c(1:9),c(16)], mode="character")

    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_upa_tran1030am_all = gmapsdistance(origin = yx_org_1,
                                            destination = yx_dest_upa, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)
od_orig2_upa_tran1030am_all = gmapsdistance(origin = yx_org_2,
                                            destination = yx_dest_upa, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)
od_orig3_upa_tran1030am_all = gmapsdistance(origin = yx_org_3,
                                            destination = yx_dest_upa, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)
od_orig4_upa_tran1030am_all = gmapsdistance(origin = yx_org_4,
                                            destination = yx_dest_upa, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)
od_orig5_upa_tran1030am_all = gmapsdistance(origin = yx_org_5,
                                            destination = yx_dest_upa, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_health)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time <- od_orig1_upa_tran1030am_all$Time
    write.csv (od_orig1_upa_tran1030am_time, "gmapsraw_od_orig1_upa_tran1030am_time.csv") 
od_orig2_upa_tran1030am_time <- od_orig2_upa_tran1030am_all$Time
    write.csv (od_orig2_upa_tran1030am_time, "gmapsraw_od_orig2_upa_tran1030am_time.csv")
od_orig3_upa_tran1030am_time <- od_orig3_upa_tran1030am_all$Time
    write.csv (od_orig3_upa_tran1030am_time, "gmapsraw_od_orig3_upa_tran1030am_time.csv")
od_orig4_upa_tran1030am_time <- od_orig4_upa_tran1030am_all$Time
    write.csv (od_orig4_upa_tran1030am_time, "gmapsraw_od_orig4_upa_tran1030am_time.csv")
od_orig5_upa_tran1030am_time <- od_orig4_upa_tran1030am_all$Time
    write.csv (od_orig5_upa_tran1030am_time, "gmapsraw_od_orig5_upa_tran1030am_time.csv")
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time$Minimum <- apply(od_orig1_upa_tran1030am_time[c(1:25),c(2:10)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig2_upa_tran1030am_time$Minimum <- apply(od_orig2_upa_tran1030am_time[c(1:25),c(2:10)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig3_upa_tran1030am_time$Minimum <- apply(od_orig3_upa_tran1030am_time[c(1:25),c(2:10)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig4_upa_tran1030am_time$Minimum <- apply(od_orig4_upa_tran1030am_time[c(1:25),c(2:10)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig5_upa_tran1030am_time$Minimum <- apply(od_orig5_upa_tran1030am_time[c(1:20),c(2:10)], 
                                              1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time_min <- od_orig1_upa_tran1030am_time[c(1:25),c(1, 11)]
od_orig2_upa_tran1030am_time_min <- od_orig2_upa_tran1030am_time[c(1:25),c(1, 11)]
od_orig3_upa_tran1030am_time_min <- od_orig3_upa_tran1030am_time[c(1:25),c(1, 11)]
od_orig4_upa_tran1030am_time_min <- od_orig4_upa_tran1030am_time[c(1:25),c(1, 11)]
od_orig5_upa_tran1030am_time_min <- od_orig5_upa_tran1030am_time[c(1:20),c(1, 11)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig2_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig3_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig4_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig5_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_upa_tran1030am_time <- rbind(od_orig1_upa_tran1030am_time_min, 
                                     od_orig2_upa_tran1030am_time_min,
                                     od_orig3_upa_tran1030am_time_min,
                                     od_orig4_upa_tran1030am_time_min,
                                     od_orig5_upa_tran1030am_time_min)
write.csv (od_orig_upa_tran1030am_time, "googletransit_od_orig_upa_tran1030am_time.csv") 









