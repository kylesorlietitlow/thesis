#Clear the list
rm(list=ls())

setwd("D:/Thesis/R/CaseStudy_Quilmes")

library(gmapsdistance)

#Set the API key connected to the titlowsorliefamily@gmail.com account
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
    yx_org_4 <- as.vector(orig_all[c(76:92),c(4)], mode="character")      
    
      
#-----------------------------------------------------------------------------------------------      
#Import CSV containing YX destination data for Buenos Aires' central CBD (1)
  dest_cbd_bsa <- read.csv("destinations_cbd_buenosaires.csv", header=TRUE)
      yx_dest_cbdbsas <- dest_cbd_bsa$YX_ORIGIN
 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
od_orig1_cbdbsas_tran0700am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_cbdbsas, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig2_cbdbsas_tran0700am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_cbdbsas, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig3_cbdbsas_tran0700am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_cbdbsas, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig4_cbdbsas_tran0700am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_cbdbsas, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
      
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdbsas_tran0700am_time <- od_orig1_cbdbsas_tran0700am_all$Time
od_orig2_cbdbsas_tran0700am_time <- od_orig2_cbdbsas_tran0700am_all$Time
od_orig3_cbdbsas_tran0700am_time <- od_orig3_cbdbsas_tran0700am_all$Time
od_orig4_cbdbsas_tran0700am_time <- od_orig4_cbdbsas_tran0700am_all$Time     

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_cbdbsas_tran0700am_time, "gmapsraw_od_orig1_cbdbsas_tran0700am_time.csv") 
write.csv (od_orig2_cbdbsas_tran0700am_time, "gmapsraw_od_orig2_cbdbsas_tran0700am_time.csv")  
write.csv (od_orig3_cbdbsas_tran0700am_time, "gmapsraw_od_orig3_cbdbsas_tran0700am_time.csv")  
write.csv (od_orig4_cbdbsas_tran0700am_time, "gmapsraw_od_orig4_cbdbsas_tran0700am_time.csv")  
     
      
#-----------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' central CBD (1)
dest_cbd_qlm <- read.csv("destinations_cbd_quilmes.csv", header=TRUE)
  yx_dest_cbdloc <- dest_cbd_qlm$YX_ORIGIN

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
od_orig1_cbdloc_tran0700am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_cbdloc, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig2_cbdloc_tran0700am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_cbdloc, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig3_cbdloc_tran0700am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_cbdloc, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig4_cbdloc_tran0700am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_cbdloc, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
      
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdloc_tran0700am_time <- od_orig1_cbdloc_tran0700am_all$Time
od_orig2_cbdloc_tran0700am_time <- od_orig2_cbdloc_tran0700am_all$Time
od_orig3_cbdloc_tran0700am_time <- od_orig3_cbdloc_tran0700am_all$Time
od_orig4_cbdloc_tran0700am_time <- od_orig4_cbdloc_tran0700am_all$Time     
      
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_cbdloc_tran0700am_time, "gmapsraw_od_orig1_cbdloc_tran0700am_time.csv") 
write.csv (od_orig2_cbdloc_tran0700am_time, "gmapsraw_od_orig2_cbdloc_tran0700am_time.csv")  
write.csv (od_orig3_cbdloc_tran0700am_time, "gmapsraw_od_orig3_cbdloc_tran0700am_time.csv")  
write.csv (od_orig4_cbdloc_tran0700am_time, "gmapsraw_od_orig4_cbdloc_tran0700am_time.csv")    
      
#-----------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' proximate rail stations (19)
      dest_rail <- read.csv("destinations_railroadstations_near.csv", header=TRUE)
      yx_dest_rail <- dest_rail$YX_DESTINO 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
od_orig1_rail_tran0700am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_rail, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig2_rail_tran0700am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_rail, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig3_rail_tran0700am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_rail, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
od_orig4_rail_tran0700am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_rail, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_work)
      
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_rail_tran0700am_time <- od_orig1_rail_tran0700am_all$Time
od_orig2_rail_tran0700am_time <- od_orig2_rail_tran0700am_all$Time
od_orig3_rail_tran0700am_time <- od_orig3_rail_tran0700am_all$Time
od_orig4_rail_tran0700am_time <- od_orig4_rail_tran0700am_all$Time     
      
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_rail_tran0700am_time, "gmapsraw_od_orig1_rail_tran0700am_time.csv") 
write.csv (od_orig2_rail_tran0700am_time, "gmapsraw_od_orig2_rail_tran0700am_time.csv")  
write.csv (od_orig3_rail_tran0700am_time, "gmapsraw_od_orig3_rail_tran0700am_time.csv")  
write.csv (od_orig4_rail_tran0700am_time, "gmapsraw_od_orig4_rail_tran0700am_time.csv")   
 
      


#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' neighboring CBD's (7)
dest_cbd_neigh <- read.csv("destinations_cbd_neighbors.csv", header=TRUE)
    yx_dest_cbdngh <- as.vector(dest_cbd_neigh[c(1:8),c(2)], mode="character")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_cbdngh_tran0700am = gmapsdistance(origin = yx_org_1,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)
od_orig2_cbdngh_tran0700am = gmapsdistance(origin = yx_org_2,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)
od_orig3_cbdngh_tran0700am = gmapsdistance(origin = yx_org_3,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)
od_orig4_cbdngh_tran0700am = gmapsdistance(origin = yx_org_4,
                                            destination = yx_dest_cbdngh, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran0700am_time <- od_orig1_cbdngh_tran0700am$Time
od_orig2_cbdngh_tran0700am_time <- od_orig2_cbdngh_tran0700am$Time
od_orig3_cbdngh_tran0700am_time <- od_orig3_cbdngh_tran0700am$Time
od_orig4_cbdngh_tran0700am_time <- od_orig4_cbdngh_tran0700am$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_cbdngh_tran0700am_time, "gmapsraw_od_orig1_cbdngh_tran0700am_time.csv") 
write.csv (od_orig2_cbdngh_tran0700am_time, "gmapsraw_od_orig2_cbdngh_tran0700am_time.csv")  
write.csv (od_orig3_cbdngh_tran0700am_time, "gmapsraw_od_orig3_cbdngh_tran0700am_time.csv")  
write.csv (od_orig4_cbdngh_tran0700am_time, "gmapsraw_od_orig4_cbdngh_tran0700am_time.csv")  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran0700am_time$Minimum <- apply(od_orig1_cbdngh_tran0700am_time[c(1:25),c(2:9)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig2_cbdngh_tran0700am_time$Minimum <- apply(od_orig2_cbdngh_tran0700am_time[c(1:25),c(2:9)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig3_cbdngh_tran0700am_time$Minimum <- apply(od_orig3_cbdngh_tran0700am_time[c(1:25),c(2:9)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig4_cbdngh_tran0700am_time$Minimum <- apply(od_orig4_cbdngh_tran0700am_time[c(1:17),c(2:9)], 
                                              1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran0700am_time_min <- od_orig1_cbdngh_tran0700am_time[c(1:25),c(1, 10)]
od_orig2_cbdngh_tran0700am_time_min <- od_orig2_cbdngh_tran0700am_time[c(1:25),c(1, 10)]
od_orig3_cbdngh_tran0700am_time_min <- od_orig3_cbdngh_tran0700am_time[c(1:25),c(1, 10)]
od_orig4_cbdngh_tran0700am_time_min <- od_orig4_cbdngh_tran0700am_time[c(1:17),c(1, 10)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_cbdngh_tran0700am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig2_cbdngh_tran0700am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig3_cbdngh_tran0700am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig4_cbdngh_tran0700am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_cbdngh_tran0700am_time <- rbind(od_orig1_cbdngh_tran0700am_time_min, 
                                     od_orig2_cbdngh_tran0700am_time_min,
                                     od_orig3_cbdngh_tran0700am_time_min,
                                     od_orig4_cbdngh_tran0700am_time_min)
write.csv (od_orig_cbdngh_tran0700am_time, "googletransit_od_orig_cbdngh_tran0700am_time.csv")   

#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' kindergartens (120)
dest_ed_kinder <- read.csv("destinations_ed_provpub_kindergarten.csv", header=TRUE)
    yx_dest_edknd1 <- as.vector(dest_ed_kinder[c(1:25),c(28)], mode="character")
    yx_dest_edknd2 <- as.vector(dest_ed_kinder[c(26:50),c(28)], mode="character")
    yx_dest_edknd3 <- as.vector(dest_ed_kinder[c(51:75),c(28)], mode="character")
    yx_dest_edknd4 <- as.vector(dest_ed_kinder[c(76:100),c(28)], mode="character")
    yx_dest_edknd5 <- as.vector(dest_ed_kinder[c(101:120),c(28)], mode="character")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_1, destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_1, destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_1, destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_1, destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_1, destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
    
od_orig2_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_2, destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_2, destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_2, destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_2, destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_2, destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig3_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_3, destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_3, destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_3, destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_3, destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_3, destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig4_edknd1_tran1200pm_all = gmapsdistance(origin = yx_org_4, destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd2_tran1200pm_all = gmapsdistance(origin = yx_org_4, destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd3_tran1200pm_all = gmapsdistance(origin = yx_org_4, destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd4_tran1200pm_all = gmapsdistance(origin = yx_org_4, destination = yx_dest_edknd4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edknd5_tran1200pm_all = gmapsdistance(origin = yx_org_4, destination = yx_dest_edknd5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edknd1_tran1200pm_time <- od_orig1_edknd1_tran1200pm_all$Time
od_orig1_edknd2_tran1200pm_time <- od_orig1_edknd2_tran1200pm_all$Time
od_orig1_edknd3_tran1200pm_time <- od_orig1_edknd3_tran1200pm_all$Time
od_orig1_edknd4_tran1200pm_time <- od_orig1_edknd4_tran1200pm_all$Time
od_orig1_edknd5_tran1200pm_time <- od_orig1_edknd5_tran1200pm_all$Time

od_orig2_edknd1_tran1200pm_time <- od_orig2_edknd1_tran1200pm_all$Time
od_orig2_edknd2_tran1200pm_time <- od_orig2_edknd2_tran1200pm_all$Time
od_orig2_edknd3_tran1200pm_time <- od_orig2_edknd3_tran1200pm_all$Time
od_orig2_edknd4_tran1200pm_time <- od_orig2_edknd4_tran1200pm_all$Time
od_orig2_edknd5_tran1200pm_time <- od_orig2_edknd5_tran1200pm_all$Time

od_orig3_edknd1_tran1200pm_time <- od_orig3_edknd1_tran1200pm_all$Time
od_orig3_edknd2_tran1200pm_time <- od_orig3_edknd2_tran1200pm_all$Time
od_orig3_edknd3_tran1200pm_time <- od_orig3_edknd3_tran1200pm_all$Time
od_orig3_edknd4_tran1200pm_time <- od_orig3_edknd4_tran1200pm_all$Time
od_orig3_edknd5_tran1200pm_time <- od_orig3_edknd5_tran1200pm_all$Time

od_orig4_edknd1_tran1200pm_time <- od_orig4_edknd1_tran1200pm_all$Time
od_orig4_edknd2_tran1200pm_time <- od_orig4_edknd2_tran1200pm_all$Time
od_orig4_edknd3_tran1200pm_time <- od_orig4_edknd3_tran1200pm_all$Time
od_orig4_edknd4_tran1200pm_time <- od_orig4_edknd4_tran1200pm_all$Time
od_orig4_edknd5_tran1200pm_time <- od_orig4_edknd5_tran1200pm_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    temp_1a <- merge(od_orig1_edknd1_tran1200pm_time, od_orig1_edknd2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig1_edknd3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig1_edknd4_tran1200pm_time)
od_orig1_edknd_tran1200pm_time <- merge(temp_1c, od_orig1_edknd5_tran1200pm_time)

    temp_1a <- merge(od_orig2_edknd1_tran1200pm_time, od_orig2_edknd2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig2_edknd3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig2_edknd4_tran1200pm_time)
od_orig2_edknd_tran1200pm_time <- merge(temp_1c, od_orig2_edknd5_tran1200pm_time)

    temp_1a <- merge(od_orig3_edknd1_tran1200pm_time, od_orig3_edknd2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig3_edknd3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig3_edknd4_tran1200pm_time)
od_orig3_edknd_tran1200pm_time <- merge(temp_1c, od_orig3_edknd5_tran1200pm_time)

    temp_1a <- merge(od_orig4_edknd1_tran1200pm_time, od_orig4_edknd2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig4_edknd3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig4_edknd4_tran1200pm_time)
od_orig4_edknd_tran1200pm_time <- merge(temp_1c, od_orig4_edknd5_tran1200pm_time)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_edknd_tran1200pm_time, "gmapsraw_od_orig1_edknd_tran1200pm_time.csv") 
write.csv (od_orig2_edknd_tran1200pm_time, "gmapsraw_od_orig2_edknd_tran1200pm_time.csv")  
write.csv (od_orig3_edknd_tran1200pm_time, "gmapsraw_od_orig3_edknd_tran1200pm_time.csv")  
write.csv (od_orig4_edknd_tran1200pm_time, "gmapsraw_od_orig4_edknd_tran1200pm_time.csv") 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edknd_tran1200pm_time$Minimum <- apply(od_orig1_edknd_tran1200pm_time[ ,c(2:121)], 
                                                1, FUN=min, na.rm=TRUE)    
od_orig2_edknd_tran1200pm_time$Minimum <- apply(od_orig2_edknd_tran1200pm_time[ ,c(2:121)], 
                                                1, FUN=min, na.rm=TRUE)  
od_orig3_edknd_tran1200pm_time$Minimum <- apply(od_orig3_edknd_tran1200pm_time[ ,c(2:121)], 
                                                1, FUN=min, na.rm=TRUE)  
od_orig4_edknd_tran1200pm_time$Minimum <- apply(od_orig4_edknd_tran1200pm_time[ ,c(2:121)], 
                                                1, FUN=min, na.rm=TRUE)  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edknd_tran1200pm_time_min <- od_orig1_edknd_tran1200pm_time[,c(1, 122)]    
od_orig2_edknd_tran1200pm_time_min <- od_orig2_edknd_tran1200pm_time[,c(1, 122)]  
od_orig3_edknd_tran1200pm_time_min <- od_orig3_edknd_tran1200pm_time[,c(1, 122)]  
od_orig4_edknd_tran1200pm_time_min <- od_orig4_edknd_tran1200pm_time[,c(1, 122)]  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_edknd_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edknd_min")    
colnames(od_orig2_edknd_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edknd_min")  
colnames(od_orig3_edknd_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edknd_min")  
colnames(od_orig4_edknd_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edknd_min")  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edknd_tran1200pm_time <- rbind(od_orig1_edknd_tran1200pm_time_min, 
                                       od_orig2_edknd_tran1200pm_time_min,
                                       od_orig3_edknd_tran1200pm_time_min,
                                       od_orig4_edknd_tran1200pm_time_min)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edknd_tran1200pm_time$trvtime_edknd_min <- (od_orig_edknd_tran1200pm_time$trvtime_edknd_min/60)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_edknd_tran1200pm_time, "googletransit_od_orig_edknd_tran1200pm_time.csv") 




#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' primary schools (109)
dest_ed_prim <- read.csv("destinations_ed_provpub_primary.csv", header=TRUE)
    yx_dest_edprm1 <- as.vector(dest_ed_prim[c(1:25),c(28)], mode="character")
    yx_dest_edprm2 <- as.vector(dest_ed_prim[c(26:50),c(28)], mode="character")
    yx_dest_edprm3 <- as.vector(dest_ed_prim[c(51:75),c(28)], mode="character")
    yx_dest_edprm4 <- as.vector(dest_ed_prim[c(76:100),c(28)], mode="character")
    yx_dest_edprm5 <- as.vector(dest_ed_prim[c(101:109),c(28)], mode="character")

    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edprm1_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edprm2_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edprm3_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edprm4_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edprm5_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig2_edprm1_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edprm2_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edprm3_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edprm4_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edprm5_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig3_edprm1_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edprm2_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edprm3_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edprm4_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edprm5_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig4_edprm1_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edprm1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edprm2_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edprm2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edprm3_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edprm3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edprm4_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edprm4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edprm5_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edprm5, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edprm1_tran1200pm_time <- od_orig1_edprm1_tran1200pm_all$Time
od_orig1_edprm2_tran1200pm_time <- od_orig1_edprm2_tran1200pm_all$Time
od_orig1_edprm3_tran1200pm_time <- od_orig1_edprm3_tran1200pm_all$Time
od_orig1_edprm4_tran1200pm_time <- od_orig1_edprm4_tran1200pm_all$Time
od_orig1_edprm5_tran1200pm_time <- od_orig1_edprm5_tran1200pm_all$Time

od_orig2_edprm1_tran1200pm_time <- od_orig2_edprm1_tran1200pm_all$Time
od_orig2_edprm2_tran1200pm_time <- od_orig2_edprm2_tran1200pm_all$Time
od_orig2_edprm3_tran1200pm_time <- od_orig2_edprm3_tran1200pm_all$Time
od_orig2_edprm4_tran1200pm_time <- od_orig2_edprm4_tran1200pm_all$Time
od_orig2_edprm5_tran1200pm_time <- od_orig2_edprm5_tran1200pm_all$Time

od_orig3_edprm1_tran1200pm_time <- od_orig3_edprm1_tran1200pm_all$Time
od_orig3_edprm2_tran1200pm_time <- od_orig3_edprm2_tran1200pm_all$Time
od_orig3_edprm3_tran1200pm_time <- od_orig3_edprm3_tran1200pm_all$Time
od_orig3_edprm4_tran1200pm_time <- od_orig3_edprm4_tran1200pm_all$Time
od_orig3_edprm5_tran1200pm_time <- od_orig3_edprm5_tran1200pm_all$Time

od_orig4_edprm1_tran1200pm_time <- od_orig4_edprm1_tran1200pm_all$Time
od_orig4_edprm2_tran1200pm_time <- od_orig4_edprm2_tran1200pm_all$Time
od_orig4_edprm3_tran1200pm_time <- od_orig4_edprm3_tran1200pm_all$Time
od_orig4_edprm4_tran1200pm_time <- od_orig4_edprm4_tran1200pm_all$Time
od_orig4_edprm5_tran1200pm_time <- od_orig4_edprm5_tran1200pm_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    temp_1a <- merge(od_orig1_edprm1_tran1200pm_time, od_orig1_edprm2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig1_edprm3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig1_edprm4_tran1200pm_time)
od_orig1_edprm_tran1200pm_time <- merge(temp_1c, od_orig1_edprm5_tran1200pm_time)

    temp_1a <- merge(od_orig2_edprm1_tran1200pm_time, od_orig2_edprm2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig2_edprm3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig2_edprm4_tran1200pm_time)
od_orig2_edprm_tran1200pm_time <- merge(temp_1c, od_orig2_edprm5_tran1200pm_time)

    temp_1a <- merge(od_orig3_edprm1_tran1200pm_time, od_orig3_edprm2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig3_edprm3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig3_edprm4_tran1200pm_time)
od_orig3_edprm_tran1200pm_time <- merge(temp_1c, od_orig3_edprm5_tran1200pm_time)

    temp_1a <- merge(od_orig4_edprm1_tran1200pm_time, od_orig4_edprm2_tran1200pm_time)
    temp_1b <- merge(temp_1a, od_orig4_edprm3_tran1200pm_time)
    temp_1c <- merge(temp_1b, od_orig4_edprm4_tran1200pm_time)
od_orig4_edprm_tran1200pm_time <- merge(temp_1c, od_orig4_edprm5_tran1200pm_time)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_edprm_tran1200pm_time, "gmapsraw_od_orig1_edprm_tran1200pm_time.csv") 
write.csv (od_orig2_edprm_tran1200pm_time, "gmapsraw_od_orig2_edprm_tran1200pm_time.csv")  
write.csv (od_orig3_edprm_tran1200pm_time, "gmapsraw_od_orig3_edprm_tran1200pm_time.csv")  
write.csv (od_orig4_edprm_tran1200pm_time, "gmapsraw_od_orig4_edprm_tran1200pm_time.csv")  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edprm_tran1200pm_time$Minimum <- apply(od_orig1_edprm_tran1200pm_time[ ,c(2:110)], 
                                                1, FUN=min, na.rm=TRUE)    
od_orig2_edprm_tran1200pm_time$Minimum <- apply(od_orig2_edprm_tran1200pm_time[ ,c(2:110)], 
                                                1, FUN=min, na.rm=TRUE)  
od_orig3_edprm_tran1200pm_time$Minimum <- apply(od_orig3_edprm_tran1200pm_time[ ,c(2:110)], 
                                                1, FUN=min, na.rm=TRUE)  
od_orig4_edprm_tran1200pm_time$Minimum <- apply(od_orig4_edprm_tran1200pm_time[ ,c(2:110)], 
                                                1, FUN=min, na.rm=TRUE)  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edprm_tran1200pm_time_min <- od_orig1_edprm_tran1200pm_time[,c(1, 111)]    
od_orig2_edprm_tran1200pm_time_min <- od_orig2_edprm_tran1200pm_time[,c(1, 111)]  
od_orig3_edprm_tran1200pm_time_min <- od_orig3_edprm_tran1200pm_time[,c(1, 111)]  
od_orig4_edprm_tran1200pm_time_min <- od_orig4_edprm_tran1200pm_time[,c(1, 111)]  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_edprm_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edprm_min")    
colnames(od_orig2_edprm_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edprm_min")  
colnames(od_orig3_edprm_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edprm_min")  
colnames(od_orig4_edprm_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edprm_min")  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edprm_tran1200pm_time <- rbind(od_orig1_edprm_tran1200pm_time_min, 
                                       od_orig2_edprm_tran1200pm_time_min,
                                       od_orig3_edprm_tran1200pm_time_min,
                                       od_orig4_edprm_tran1200pm_time_min)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edprm_tran1200pm_time$trvtime_edprm_min <- (od_orig_edprm_tran1200pm_time$trvtime_edprm_min/60)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_edprm_tran1200pm_time, "googletransit_od_orig_edprm_tran1200pm_time.csv") 


       
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' secondary schools (78)
dest_ed_second <- read.csv("destinations_ed_provpub_secondary.csv", header=TRUE)
    yx_dest_edsec1 <- as.vector(dest_ed_second[c(1:25),c(28)], mode="character")
    yx_dest_edsec2 <- as.vector(dest_ed_second[c(26:50),c(28)], mode="character")
    yx_dest_edsec3 <- as.vector(dest_ed_second[c(51:75),c(28)], mode="character")
    yx_dest_edsec4 <- as.vector(dest_ed_second[c(76:78),c(28)], mode="character")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig2_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig3_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
    
od_orig4_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig4_edsec4_tran1200pm_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_edsec4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)    

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec1_tran1200pm_time <- od_orig1_edsec1_tran1200pm_all$Time
od_orig1_edsec2_tran1200pm_time <- od_orig1_edsec2_tran1200pm_all$Time
od_orig1_edsec3_tran1200pm_time <- od_orig1_edsec3_tran1200pm_all$Time
od_orig1_edsec4_tran1200pm_time <- od_orig1_edsec4_tran1200pm_all$Time

od_orig2_edsec1_tran1200pm_time <- od_orig2_edsec1_tran1200pm_all$Time
od_orig2_edsec2_tran1200pm_time <- od_orig2_edsec2_tran1200pm_all$Time
od_orig2_edsec3_tran1200pm_time <- od_orig2_edsec3_tran1200pm_all$Time
od_orig2_edsec4_tran1200pm_time <- od_orig2_edsec4_tran1200pm_all$Time

od_orig3_edsec1_tran1200pm_time <- od_orig3_edsec1_tran1200pm_all$Time
od_orig3_edsec2_tran1200pm_time <- od_orig3_edsec2_tran1200pm_all$Time
od_orig3_edsec3_tran1200pm_time <- od_orig3_edsec3_tran1200pm_all$Time
od_orig3_edsec4_tran1200pm_time <- od_orig3_edsec4_tran1200pm_all$Time

od_orig4_edsec1_tran1200pm_time <- od_orig4_edsec1_tran1200pm_all$Time
od_orig4_edsec2_tran1200pm_time <- od_orig4_edsec2_tran1200pm_all$Time
od_orig4_edsec3_tran1200pm_time <- od_orig4_edsec3_tran1200pm_all$Time
od_orig4_edsec4_tran1200pm_time <- od_orig4_edsec4_tran1200pm_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

od_orig1_edsec_tran1200pm_time <- merge(temp1b <- merge(temp1a <- merge(od_orig1_edsec1_tran1200pm_time, 
                                                                         od_orig1_edsec2_tran1200pm_time), 
                                                         od_orig1_edsec3_tran1200pm_time), 
                                         od_orig1_edsec4_tran1200pm_time) 

od_orig2_edsec_tran1200pm_time <- merge(temp1b <- merge(temp1a <- merge(od_orig2_edsec1_tran1200pm_time, 
                                                                        od_orig2_edsec2_tran1200pm_time), 
                                                        od_orig2_edsec3_tran1200pm_time), 
                                        od_orig2_edsec4_tran1200pm_time) 

od_orig3_edsec_tran1200pm_time <- merge(temp1b <- merge(temp1a <- merge(od_orig3_edsec1_tran1200pm_time, 
                                                                        od_orig3_edsec2_tran1200pm_time), 
                                                        od_orig3_edsec3_tran1200pm_time), 
                                        od_orig3_edsec4_tran1200pm_time) 

od_orig4_edsec_tran1200pm_time <- merge(temp1b <- merge(temp1a <- merge(od_orig4_edsec1_tran1200pm_time, 
                                                                        od_orig4_edsec2_tran1200pm_time), 
                                                        od_orig4_edsec3_tran1200pm_time), 
                                        od_orig4_edsec4_tran1200pm_time) 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_edsec_tran1200pm_time, "gmapsraw_od_orig1_edsec_tran1200pm_time.csv") 
write.csv (od_orig2_edsec_tran1200pm_time, "gmapsraw_od_orig2_edsec_tran1200pm_time.csv")  
write.csv (od_orig3_edsec_tran1200pm_time, "gmapsraw_od_orig3_edsec_tran1200pm_time.csv")  
write.csv (od_orig4_edsec_tran1200pm_time, "gmapsraw_od_orig4_edsec_tran1200pm_time.csv")  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec_tran1200pm_time$Minimum <- apply(od_orig1_edsec_tran1200pm_time[ ,c(2:61)], 
                                                 1, FUN=min, na.rm=TRUE)    
od_orig2_edsec_tran1200pm_time$Minimum <- apply(od_orig2_edsec_tran1200pm_time[ ,c(2:61)], 
                                                 1, FUN=min, na.rm=TRUE)  
od_orig3_edsec_tran1200pm_time$Minimum <- apply(od_orig3_edsec_tran1200pm_time[ ,c(2:61)], 
                                                 1, FUN=min, na.rm=TRUE)  
od_orig4_edsec_tran1200pm_time$Minimum <- apply(od_orig4_edsec_tran1200pm_time[ ,c(2:61)], 
                                                 1, FUN=min, na.rm=TRUE)  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec_tran1200pm_time_min <- od_orig1_edsec_tran1200pm_time[,c(1, 62)]    
od_orig2_edsec_tran1200pm_time_min <- od_orig2_edsec_tran1200pm_time[,c(1, 62)]  
od_orig3_edsec_tran1200pm_time_min <- od_orig3_edsec_tran1200pm_time[,c(1, 62)]  
od_orig4_edsec_tran1200pm_time_min <- od_orig4_edsec_tran1200pm_time[,c(1, 62)]  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_min")    
colnames(od_orig2_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_min")  
colnames(od_orig3_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_min")  
colnames(od_orig4_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_min")  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edsec_tran1200pm_time <- rbind(od_orig1_edsec_tran1200pm_time_min, 
                                        od_orig2_edsec_tran1200pm_time_min,
                                        od_orig3_edsec_tran1200pm_time_min,
                                        od_orig4_edsec_tran1200pm_time_min)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edsec_tran1200pm_time$trvtime_edsec_min <- (od_orig_edsec_tran1200pm_time$trvtime_edsec_min/60)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_edsec_tran1200pm_time, "googletransit_od_orig_edsec_tran1200pm_time.csv") 


        
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' public hospitals (11)
dest_health_hosp <- read.csv("destinations_health_fedpub_hosp.csv", header=TRUE)
    yx_dest_hsp <- as.vector(dest_health_hosp[c(1:11),c(11)], mode="character")
    
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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time <- od_orig1_hspt_tran7am_all$Time
od_orig2_hspt_tran1030am_time <- od_orig2_hspt_tran7am_all$Time
od_orig3_hspt_tran1030am_time <- od_orig3_hspt_tran7am_all$Time
od_orig4_hspt_tran1030am_time <- od_orig4_hspt_tran7am_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_hspt_tran1030am_time, "gmapsraw_od_orig1_hspt_tran1030am_time.csv") 
write.csv (od_orig2_hspt_tran1030am_time, "gmapsraw_od_orig2_hspt_tran1030am_time.csv")  
write.csv (od_orig3_hspt_tran1030am_time, "gmapsraw_od_orig3_hspt_tran1030am_time.csv")  
write.csv (od_orig4_hspt_tran1030am_time, "gmapsraw_od_orig4_hspt_tran1030am_time.csv")  
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time$Minimum <- apply(od_orig1_hspt_tran1030am_time[c(1:25),c(2:12)], 
                                               1, FUN=min, na.rm=TRUE)
od_orig2_hspt_tran1030am_time$Minimum <- apply(od_orig2_hspt_tran1030am_time[c(1:25),c(2:12)], 
                                               1, FUN=min, na.rm=TRUE)
od_orig3_hspt_tran1030am_time$Minimum <- apply(od_orig3_hspt_tran1030am_time[c(1:25),c(2:12)], 
                                               1, FUN=min, na.rm=TRUE)
od_orig4_hspt_tran1030am_time$Minimum <- apply(od_orig4_hspt_tran1030am_time[c(1:17),c(2:12)], 
                                               1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time_min <- od_orig1_hspt_tran1030am_time[c(1:25),c(1, 13)]
od_orig2_hspt_tran1030am_time_min <- od_orig2_hspt_tran1030am_time[c(1:25),c(1, 13)]
od_orig3_hspt_tran1030am_time_min <- od_orig3_hspt_tran1030am_time[c(1:25),c(1, 13)]
od_orig4_hspt_tran1030am_time_min <- od_orig4_hspt_tran1030am_time[c(1:17),c(1, 13)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig2_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig3_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig4_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_hspt_tran1030am_time <- rbind(od_orig1_hspt_tran1030am_time_min, 
                                      od_orig2_hspt_tran1030am_time_min,
                                      od_orig3_hspt_tran1030am_time_min,
                                      od_orig4_hspt_tran1030am_time_min)
write.csv (od_orig_hspt_tran1030am_time, "googletransit_od_orig_hspt_tran1030am_time.csv") 
    
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' public diag/treatment centers (70)
dest_health_diagtrat <- read.csv("destinations_health_fedpub_diagtreat.csv", header=TRUE)
    yx_dest_dgntrt1 <- as.vector(dest_health_diagtrat[c(1:25),c(13)], mode="character")
    yx_dest_dgntrt2 <- as.vector(dest_health_diagtrat[c(26:50),c(13)], mode="character")
    yx_dest_dgntrt3 <- as.vector(dest_health_diagtrat[c(51:70),c(13)], mode="character")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig1_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig1_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
   
od_orig2_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig2_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig2_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

od_orig3_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig3_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig3_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

od_orig4_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig4_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig4_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_4,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
   
    
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_dgntrt1_tran1030am_time <- od_orig1_dgntrt1_tran1030am_all$Time
od_orig1_dgntrt2_tran1030am_time <- od_orig1_dgntrt2_tran1030am_all$Time
od_orig1_dgntrt3_tran1030am_time <- od_orig1_dgntrt3_tran1030am_all$Time

od_orig1_dgntrt_tran1030am_time <- merge((temp1 <- merge(od_orig1_dgntrt1_tran1030am_time, 
                                                         od_orig1_dgntrt2_tran1030am_time)), 
                                         od_orig1_dgntrt3_tran1030am_time)


od_orig2_dgntrt1_tran1030am_time <- od_orig2_dgntrt1_tran1030am_all$Time
od_orig2_dgntrt2_tran1030am_time <- od_orig2_dgntrt2_tran1030am_all$Time
od_orig2_dgntrt3_tran1030am_time <- od_orig2_dgntrt3_tran1030am_all$Time

od_orig2_dgntrt_tran1030am_time <- merge((temp2 <- merge(od_orig2_dgntrt1_tran1030am_time, 
                                                         od_orig2_dgntrt2_tran1030am_time)), 
                                         od_orig2_dgntrt3_tran1030am_time)    

od_orig3_dgntrt1_tran1030am_time <- od_orig3_dgntrt1_tran1030am_all$Time
od_orig3_dgntrt2_tran1030am_time <- od_orig3_dgntrt2_tran1030am_all$Time
od_orig3_dgntrt3_tran1030am_time <- od_orig3_dgntrt3_tran1030am_all$Time

od_orig3_dgntrt_tran1030am_time <- merge((temp2 <- merge(od_orig3_dgntrt1_tran1030am_time, 
                                                         od_orig3_dgntrt2_tran1030am_time)), 
                                         od_orig3_dgntrt3_tran1030am_time)    


od_orig4_dgntrt1_tran1030am_time <- od_orig4_dgntrt1_tran1030am_all$Time
od_orig4_dgntrt2_tran1030am_time <- od_orig4_dgntrt2_tran1030am_all$Time
od_orig4_dgntrt3_tran1030am_time <- od_orig4_dgntrt3_tran1030am_all$Time

od_orig4_dgntrt_tran1030am_time <- merge((temp2 <- merge(od_orig4_dgntrt1_tran1030am_time, 
                                                         od_orig4_dgntrt2_tran1030am_time)), 
                                         od_orig4_dgntrt3_tran1030am_time)    
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_dgntrt_tran1030am_time, "gmapsraw_od_orig1_dgntrt_tran1030am_time.csv") 
write.csv (od_orig2_dgntrt_tran1030am_time, "gmapsraw_od_orig2_dgntrt_tran1030am_time.csv") 
write.csv (od_orig3_dgntrt_tran1030am_time, "gmapsraw_od_orig3_dgntrt_tran1030am_time.csv") 
write.csv (od_orig4_dgntrt_tran1030am_time, "gmapsraw_od_orig4_dgntrt_tran1030am_time.csv") 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_dgntrt_tran1030am_time$Minimum <- apply(od_orig1_dgntrt_tran1030am_time[c(1:25),c(2:71)], 
                                                 1, FUN=min, na.rm=TRUE)
od_orig2_dgntrt_tran1030am_time$Minimum <- apply(od_orig2_dgntrt_tran1030am_time[c(1:25),c(2:71)], 
                                                 1, FUN=min, na.rm=TRUE)
od_orig3_dgntrt_tran1030am_time$Minimum <- apply(od_orig3_dgntrt_tran1030am_time[c(1:25),c(2:71)], 
                                                 1, FUN=min, na.rm=TRUE)
od_orig4_dgntrt_tran1030am_time$Minimum <- apply(od_orig4_dgntrt_tran1030am_time[c(1:17),c(2:71)], 
                                                 1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_dgntrt_tran1030am_time_min <- od_orig1_dgntrt_tran1030am_time[c(1:25),c(1, 72)]
od_orig2_dgntrt_tran1030am_time_min <- od_orig2_dgntrt_tran1030am_time[c(1:25),c(1, 72)]
od_orig3_dgntrt_tran1030am_time_min <- od_orig3_dgntrt_tran1030am_time[c(1:25),c(1, 72)]
od_orig4_dgntrt_tran1030am_time_min <- od_orig4_dgntrt_tran1030am_time[c(1:17),c(1, 72)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")
colnames(od_orig2_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")
colnames(od_orig3_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")
colnames(od_orig4_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")


od_orig_dgntrt_tran1030am_time <- rbind(od_orig1_dgntrt_tran1030am_time_min, 
                                     od_orig2_dgntrt_tran1030am_time_min,
                                     od_orig3_dgntrt_tran1030am_time_min,
                                     od_orig4_dgntrt_tran1030am_time_min)
write.csv (od_orig_dgntrt_tran1030am_time, "googletransit_od_orig_dgntrt_tran1030am_time.csv") 


#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Quilmes' UPAs (7)
dest_health_upa <- read.csv("destinations_health_provpub_upa.csv", header=TRUE)
    yx_dest_upa <- as.vector(dest_health_upa[c(1:7),c(16)], mode="character")

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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time <- od_orig1_upa_tran1030am_all$Time
    write.csv (od_orig1_upa_tran1030am_time, "gmapsraw_od_orig1_upa_tran1030am_time.csv") 
od_orig2_upa_tran1030am_time <- od_orig2_upa_tran1030am_all$Time
    write.csv (od_orig2_upa_tran1030am_time, "gmapsraw_od_orig2_upa_tran1030am_time.csv")
od_orig3_upa_tran1030am_time <- od_orig3_upa_tran1030am_all$Time
    write.csv (od_orig3_upa_tran1030am_time, "gmapsraw_od_orig3_upa_tran1030am_time.csv")
od_orig4_upa_tran1030am_time <- od_orig4_upa_tran1030am_all$Time
    write.csv (od_orig4_upa_tran1030am_time, "gmapsraw_od_orig4_upa_tran1030am_time.csv")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time$Minimum <- apply(od_orig1_upa_tran1030am_time[c(1:25),c(2:8)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig2_upa_tran1030am_time$Minimum <- apply(od_orig2_upa_tran1030am_time[c(1:25),c(2:8)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig3_upa_tran1030am_time$Minimum <- apply(od_orig3_upa_tran1030am_time[c(1:25),c(2:8)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig4_upa_tran1030am_time$Minimum <- apply(od_orig4_upa_tran1030am_time[c(1:17),c(2:8)], 
                                              1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time_min <- od_orig1_upa_tran1030am_time[c(1:25),c(1, 9)]
od_orig2_upa_tran1030am_time_min <- od_orig2_upa_tran1030am_time[c(1:25),c(1, 9)]
od_orig3_upa_tran1030am_time_min <- od_orig3_upa_tran1030am_time[c(1:25),c(1, 9)]
od_orig4_upa_tran1030am_time_min <- od_orig4_upa_tran1030am_time[c(1:17),c(1, 9)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig2_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig3_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig4_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_upa_tran1030am_time <- rbind(od_orig1_upa_tran1030am_time_min, 
                                     od_orig2_upa_tran1030am_time_min,
                                     od_orig3_upa_tran1030am_time_min,
                                     od_orig4_upa_tran1030am_time_min)
write.csv (od_orig_upa_tran1030am_time, "googletransit_od_orig_upa_tran1030am_time.csv") 
