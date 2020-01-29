#Clear the list
rm(list=ls())

setwd("D:/Thesis/R/CaseStudy_Pilar")

library(gmapsdistance)

set.api.key("AIzaSyCZ3rV6mM-Iw9BZls_GI8oUzG7eqAPBR6I")

#Work departure time is 7:00:00 AM Buenos Aires time
dep_time_work <- "10:00:00"

#Health departure time is 10:30:00 AM Buenos Aires time
dep_time_health  <- "13:30:00"

#School departure time is 12:00:00 PM Buenos Aires time
dep_time_school <- "15:00:00"

#Remember to set the date for the subsequent WEDNESDAY; run this script before running any GMAPS
dep_date_nextwed <- "2018-02-28"

#Import CSV containing YX origin data for all radios
orig_all <- read.csv("origins_radios_all.csv", header=TRUE)
    yx_org_1 <- as.vector(orig_all[c(1:25),c(4)], mode="character")
    yx_org_2 <- as.vector(orig_all[c(26:50),c(4)], mode="character")
    yx_org_3 <- as.vector(orig_all[c(51:72),c(4)], mode="character")

#-----------------------------------------------------------------------------------------------
#IMPORT DESTINATIONS >>>
#Import CSV containing YX destination data for Buenos Aires' central CBD (1)
dst_cbd_bs <- read.csv("destinations_cbd_buenosaires.csv", header=TRUE)
    yx_dst_cbdbsas <- dst_cbd_bs$YX_ORIGIN

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_cbdbsas_tran7am = gmapsdistance(origin = yx_org_1,
                                            destination = yx_dst_cbdbsas, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)
od_orig2_cbdbsas_tran7am = gmapsdistance(origin = yx_org_2,
                                            destination = yx_dst_cbdbsas, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)
od_orig3_cbdbsas_tran7am = gmapsdistance(origin = yx_org_3,
                                            destination = yx_dst_cbdbsas, 
                                            mode="transit", 
                                            dep_date=dep_date_nextwed, 
                                            dep_time=dep_time_work)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdbsas_tran0700am_time <- od_orig1_cbdbsas_tran7am$Time
od_orig2_cbdbsas_tran0700am_time <- od_orig2_cbdbsas_tran7am$Time
od_orig3_cbdbsas_tran0700am_time <- od_orig3_cbdbsas_tran7am$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_cbdbsas_tran0700am_time <- rbind(od_orig1_cbdbsas_tran0700am_time, 
                                       od_orig2_cbdbsas_tran0700am_time,
                                       od_orig3_cbdbsas_tran0700am_time)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_cbdbsas_tran0700am_time, "gmapsraw_od_orig_cbdbsas_tran0700am_time.csv") 

#---------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's central CBD (1)
dst_cbd_local <- read.csv("destinations_cbd_pilar.csv", header=TRUE)
yx_dst_cbdloc <- dst_cbd_local$YX_ORIGIN
        
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_cbdloc_tran7am = gmapsdistance(origin = yx_org_1,
                                         destination = yx_dst_cbdloc, 
                                         mode="transit", 
                                         dep_date=dep_date_nextwed, 
                                         dep_time=dep_time_work)
od_orig2_cbdloc_tran7am = gmapsdistance(origin = yx_org_2,
                                         destination = yx_dst_cbdloc, 
                                         mode="transit", 
                                         dep_date=dep_date_nextwed, 
                                         dep_time=dep_time_work)
od_orig3_cbdloc_tran7am = gmapsdistance(origin = yx_org_3,
                                         destination = yx_dst_cbdloc, 
                                         mode="transit", 
                                         dep_date=dep_date_nextwed, 
                                         dep_time=dep_time_work)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdloc_tran0700am_time <- od_orig1_cbdloc_tran7am$Time
od_orig2_cbdloc_tran0700am_time <- od_orig2_cbdloc_tran7am$Time
od_orig3_cbdloc_tran0700am_time <- od_orig3_cbdloc_tran7am$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_cbdloc_tran0700am_time <- rbind(od_orig1_cbdloc_tran0700am_time, 
                                         od_orig2_cbdloc_tran0700am_time,
                                         od_orig3_cbdloc_tran0700am_time)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_cbdloc_tran0700am_time, "gmapsraw_od_orig_cbdloc_tran0700am_time.csv") 


#-----------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's proximate rail stations (23)
dst_rail <- read.csv("destinations_railroadstations_near.csv", header=TRUE)
    yx_dst_rail <- dst_rail$YX_DESTINO

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_rail_tran0700am = gmapsdistance(origin = yx_org_1,
                                           destination = yx_dst_rail, 
                                           mode="transit", 
                                           dep_date=dep_date_nextwed, 
                                           dep_time=dep_time_work)
od_orig2_rail_tran0700am = gmapsdistance(origin = yx_org_2,
                                           destination = yx_dst_rail, 
                                           mode="transit", 
                                           dep_date=dep_date_nextwed, 
                                           dep_time=dep_time_work)
od_orig3_rail_tran0700am = gmapsdistance(origin = yx_org_3,
                                           destination = yx_dst_rail, 
                                           mode="transit", 
                                           dep_date=dep_date_nextwed, 
                                           dep_time=dep_time_work)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_rail_tran0700am_time <- od_orig1_rail_tran0700am$Time
od_orig2_rail_tran0700am_time <- od_orig2_rail_tran0700am$Time
od_orig3_rail_tran0700am_time <- od_orig3_rail_tran0700am$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_rail_tran0700am_time <- rbind(od_orig1_rail_tran0700am_time, 
                                      od_orig2_rail_tran0700am_time,
                                      od_orig3_rail_tran0700am_time)

write.csv (od_orig_rail_tran0700am_time, "gmapsraw_od_orig_rail_tran0700am_time.csv")   
    
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's neighboring CBD's (9)
dest_cbd_neigh <- read.csv("destinations_cbd_neighbors.csv", header=TRUE)
    yx_dest_cbdngh <- as.vector(dest_cbd_neigh[c(1:9),c(3)], mode="character")

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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran0700am_time <- od_orig1_cbdngh_tran0700am$Time
od_orig2_cbdngh_tran0700am_time <- od_orig2_cbdngh_tran0700am$Time
od_orig3_cbdngh_tran0700am_time <- od_orig3_cbdngh_tran0700am$Time

od_orig1_cbdngh_tran0700am_dist <- od_orig1_cbdngh_tran0700am$Distance
od_orig2_cbdngh_tran0700am_dist <- od_orig2_cbdngh_tran0700am$Distance
od_orig3_cbdngh_tran0700am_dist <- od_orig3_cbdngh_tran0700am$Distance

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_cbdngh_tran0700am_time <- rbind(od_orig1_cbdngh_tran0700am_time, 
                                     od_orig2_cbdngh_tran0700am_time,
                                     od_orig3_cbdngh_tran0700am_time)

write.csv (od_orig_cbdngh_tran0700am_time, "gmapsraw_od_orig_cbdngh_tran0700am_time.csv")    


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran7am_time$Minimum <- apply(od_orig1_cbdngh_tran7am_time[c(1:25),c(2:10)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig2_cbdngh_tran7am_time$Minimum <- apply(od_orig2_cbdngh_tran7am_time[c(1:25),c(2:10)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig3_cbdngh_tran7am_time$Minimum <- apply(od_orig3_cbdngh_tran7am_time[c(1:22),c(2:10)], 
                                              1, FUN=min, na.rm=TRUE)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_cbdngh_tran7am_time_min <- od_orig1_cbdngh_tran7am_time[c(1:25),c(1, 11)]
od_orig2_cbdngh_tran7am_time_min <- od_orig2_cbdngh_tran7am_time[c(1:25),c(1, 11)]
od_orig3_cbdngh_tran7am_time_min <- od_orig3_cbdngh_tran7am_time[c(1:22),c(1, 11)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_cbdngh_tran7am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig2_cbdngh_tran7am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")
colnames(od_orig3_cbdngh_tran7am_time_min) <- c("YX_ORIGIN", "trvtime_cbdngh_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_cbdngh_tran7am_time, "googletransit_od_orig_cbdngh_tran7am_time.csv")   


#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's kindergartens (66)
dest_ed_kinder <- read.csv("destinations_ed_provpub_kindergarten.csv", header=TRUE)
    yx_dest_edknd1 <- as.vector(dest_ed_kinder[c(1:25),c(28)], mode="character")
    yx_dest_edknd2 <- as.vector(dest_ed_kinder[c(26:50),c(28)], mode="character")
    yx_dest_edknd3 <- as.vector(dest_ed_kinder[c(51:66),c(28)], mode="character")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_edknd1_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd2_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edknd3_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
    
od_orig2_edknd1_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd2_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edknd3_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
    
od_orig3_edknd1_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd2_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edknd3_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edknd3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edknd1_tran1200pm_time <- od_orig1_edknd1_tran1030am_all$Time
od_orig1_edknd2_tran1200pm_time <- od_orig1_edknd2_tran1030am_all$Time
od_orig1_edknd3_tran1200pm_time <- od_orig1_edknd3_tran1030am_all$Time

od_orig1_edknd_tran1200pm_time <- merge((temp1 <- merge(od_orig1_edknd1_tran1200pm_time, 
                                                         od_orig1_edknd2_tran1200pm_time)), 
                                         od_orig1_edknd3_tran1200pm_time)



od_orig2_edknd1_tran1200pm_time <- od_orig2_edknd1_tran1030am_all$Time
od_orig2_edknd2_tran1200pm_time <- od_orig2_edknd2_tran1030am_all$Time
od_orig2_edknd3_tran1200pm_time <- od_orig2_edknd3_tran1030am_all$Time

od_orig2_edknd_tran1200pm_time <- merge((temp2 <- merge(od_orig2_edknd1_tran1200pm_time, 
                                                         od_orig2_edknd2_tran1200pm_time)), 
                                         od_orig2_edknd3_tran1200pm_time)



od_orig3_edknd1_tran1200pm_time <- od_orig3_edknd1_tran1030am_all$Time
od_orig3_edknd2_tran1200pm_time <- od_orig3_edknd2_tran1030am_all$Time
od_orig3_edknd3_tran1200pm_time <- od_orig3_edknd3_tran1030am_all$Time

od_orig3_edknd_tran1200pm_time <- merge((temp3 <- merge(od_orig3_edknd1_tran1200pm_time, 
                                                         od_orig3_edknd2_tran1200pm_time)), 
                                         od_orig3_edknd3_tran1200pm_time)    

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_edknd_tran1200pm_time, "gmapsraw_od_orig1_edknd_tran1200pm_time.csv") 
write.csv (od_orig2_edknd_tran1200pm_time, "gmapsraw_od_orig2_edknd_tran1200pm_time.csv") 
write.csv (od_orig3_edknd_tran1200pm_time, "gmapsraw_od_orig3_edknd_tran1200pm_time.csv") 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edknd_tran1200pm_time$Minimum <- apply(od_orig1_edknd_tran1200pm_time[c(1:25),c(2:67)], 
                                                 1, FUN=min, na.rm=TRUE)
od_orig2_edknd_tran1200pm_time$Minimum <- apply(od_orig2_edknd_tran1200pm_time[c(1:25),c(2:67)], 
                                                 1, FUN=min, na.rm=TRUE)
od_orig3_edknd_tran1200pm_time$Minimum <- apply(od_orig3_edknd_tran1200pm_time[c(1:22),c(2:67)], 
                                                 1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edknd_tran1200pm_time_min <- od_orig1_edknd_tran1200pm_time[c(1:25),c(1, 68)]
od_orig2_edknd_tran1200pm_time_min <- od_orig2_edknd_tran1200pm_time[c(1:25),c(1, 68)]
od_orig3_edknd_tran1200pm_time_min <- od_orig3_edknd_tran1200pm_time[c(1:22),c(1, 68)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_edknd_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edknd_near")
colnames(od_orig2_edknd_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edknd_near")
colnames(od_orig3_edknd_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edknd_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edknd_tran1200pm_time <- rbind(od_orig1_edknd_tran1200pm_time_min,
                                        od_orig2_edknd_tran1200pm_time_min,
                                        od_orig3_edknd_tran1200pm_time_min)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edknd_tran1200pm_time$trvtime_edknd_near <- (od_orig_edknd_tran1200pm_time$trvtime_edknd_near/60)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_edknd_tran1200pm_time, "googletransit_od_orig_edknd_tran1200pm_time.csv") 
    
    
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's primary schools (77)
dest_ed_prim <- read.csv("destinations_ed_provpub_primary.csv", header=TRUE)
    yx_dest_edprm1 <- as.vector(dest_ed_prim[c(1:25),c(28)], mode="character")
    yx_dest_edprm2 <- as.vector(dest_ed_prim[c(26:50),c(28)], mode="character")
    yx_dest_edprm3 <- as.vector(dest_ed_prim[c(51:75),c(28)], mode="character")
    yx_dest_edprm4 <- as.vector(dest_ed_prim[c(76:77),c(28)], mode="character")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
od_orig1_edprm1_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edprm2_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edprm3_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edprm4_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edprm4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
    
od_orig2_edprm1_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edprm2_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edprm3_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edprm4_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edprm4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

od_orig3_edprm1_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edprm2_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edprm3_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edprm4_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edprm4, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edprm1_tran1200pm_time <- od_orig1_edprm1_tran1200pm_all$Time
od_orig1_edprm2_tran1200pm_time <- od_orig1_edprm2_tran1200pm_all$Time
od_orig1_edprm3_tran1200pm_time <- od_orig1_edprm3_tran1200pm_all$Time
od_orig1_edprm4_tran1200pm_time <- od_orig1_edprm4_tran1200pm_all$Time

od_orig2_edprm1_tran1200pm_time <- od_orig2_edprm1_tran1200pm_all$Time
od_orig2_edprm2_tran1200pm_time <- od_orig2_edprm2_tran1200pm_all$Time
od_orig2_edprm3_tran1200pm_time <- od_orig2_edprm3_tran1200pm_all$Time
od_orig2_edprm4_tran1200pm_time <- od_orig2_edprm4_tran1200pm_all$Time

od_orig3_edprm1_tran1200pm_time <- od_orig3_edprm1_tran1200pm_all$Time
od_orig3_edprm2_tran1200pm_time <- od_orig3_edprm2_tran1200pm_all$Time
od_orig3_edprm3_tran1200pm_time <- od_orig3_edprm3_tran1200pm_all$Time
od_orig3_edprm4_tran1200pm_time <- od_orig3_edprm4_tran1200pm_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

od_orig1_edprm_tran1200pm_time <- merge(temp1b <- merge(temp1a <- merge(od_orig1_edprm1_tran1200pm_time, 
                                                                        od_orig1_edprm2_tran1200pm_time), 
                                                        od_orig1_edprm3_tran1200pm_time), 
                                        od_orig1_edprm4_tran1200pm_time) 

od_orig2_edprm_tran1200pm_time <- merge(temp1b <- merge(temp1a <- merge(od_orig2_edprm1_tran1200pm_time, 
                                                                        od_orig2_edprm2_tran1200pm_time), 
                                                        od_orig2_edprm3_tran1200pm_time), 
                                        od_orig2_edprm4_tran1200pm_time) 

od_orig3_edprm_tran1200pm_time <- merge(temp1b <- merge(temp1a <- merge(od_orig3_edprm1_tran1200pm_time, 
                                                                        od_orig3_edprm2_tran1200pm_time), 
                                                        od_orig3_edprm3_tran1200pm_time), 
                                        od_orig3_edprm4_tran1200pm_time)  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_edprm_tran1200pm_time, "gmapsraw_od_orig1_edprm_tran1200pm_time.csv") 
write.csv (od_orig2_edprm_tran1200pm_time, "gmapsraw_od_orig2_edprm_tran1200pm_time.csv")  
write.csv (od_orig3_edprm_tran1200pm_time, "gmapsraw_od_orig3_edprm_tran1200pm_time.csv") 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edprm_tran1200pm_time$Minimum <- apply(od_orig1_edprm_tran1200pm_time[ ,c(2:78)], 
                                                1, FUN=min, na.rm=TRUE)    
od_orig2_edprm_tran1200pm_time$Minimum <- apply(od_orig2_edprm_tran1200pm_time[ ,c(2:78)], 
                                                1, FUN=min, na.rm=TRUE)  
od_orig3_edprm_tran1200pm_time$Minimum <- apply(od_orig3_edprm_tran1200pm_time[ ,c(2:78)], 
                                                1, FUN=min, na.rm=TRUE)  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edprm_tran1200pm_time_min <- od_orig1_edprm_tran1200pm_time[,c(1, 79)]    
od_orig2_edprm_tran1200pm_time_min <- od_orig2_edprm_tran1200pm_time[,c(1, 79)]  
od_orig3_edprm_tran1200pm_time_min <- od_orig3_edprm_tran1200pm_time[,c(1, 79)]  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_edprm_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edprm_min")    
colnames(od_orig2_edprm_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edprm_min")  
colnames(od_orig3_edprm_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edprm_min")  

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edprm_tran1200pm_time <- rbind(od_orig1_edprm_tran1200pm_time_min, 
                                       od_orig2_edprm_tran1200pm_time_min,
                                       od_orig3_edprm_tran1200pm_time_min)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edprm_tran1200pm_time$trvtime_edprm_min <- (od_orig_edprm_tran1200pm_time$trvtime_edprm_min/60)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_edprm_tran1200pm_time, "googletransit_od_orig_edprm_tran1200pm_time.csv") 
          
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's secondary schools (74)
dest_ed_second <- read.csv("destinations_ed_provpub_secondary.csv", header=TRUE)
    yx_dest_edsec1 <- as.vector(dest_ed_second[c(1:25),c(28)], mode="character")
    yx_dest_edsec2 <- as.vector(dest_ed_second[c(26:50),c(28)], mode="character")
    yx_dest_edsec3 <- as.vector(dest_ed_second[c(51:72),c(28)], mode="character")
  
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
od_orig1_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig1_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
    
od_orig2_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig2_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
    
od_orig3_edsec1_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec2_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)
od_orig3_edsec3_tran1200pm_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_edsec3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_school)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec1_tran1200pm_time <- od_orig1_edsec1_tran1200pm_all$Time
od_orig1_edsec2_tran1200pm_time <- od_orig1_edsec2_tran1200pm_all$Time
od_orig1_edsec3_tran1200pm_time <- od_orig1_edsec3_tran1200pm_all$Time

od_orig1_edsec_tran1200pm_time <- merge((temp1 <- merge(od_orig1_edsec1_tran1200pm_time, 
                                                        od_orig1_edsec2_tran1200pm_time)), 
                                        od_orig1_edsec3_tran1200pm_time)



od_orig2_edsec1_tran1200pm_time <- od_orig2_edsec1_tran1200pm_all$Time
od_orig2_edsec2_tran1200pm_time <- od_orig2_edsec2_tran1200pm_all$Time
od_orig2_edsec3_tran1200pm_time <- od_orig2_edsec3_tran1200pm_all$Time

od_orig2_edsec_tran1200pm_time <- merge((temp2 <- merge(od_orig2_edsec1_tran1200pm_time, 
                                                        od_orig2_edsec2_tran1200pm_time)), 
                                        od_orig2_edsec3_tran1200pm_time)



od_orig3_edsec1_tran1200pm_time <- od_orig3_edsec1_tran1200pm_all$Time
od_orig3_edsec2_tran1200pm_time <- od_orig3_edsec2_tran1200pm_all$Time
od_orig3_edsec3_tran1200pm_time <- od_orig3_edsec3_tran1200pm_all$Time

od_orig3_edsec_tran1200pm_time <- merge((temp3 <- merge(od_orig3_edsec1_tran1200pm_time, 
                                                        od_orig3_edsec2_tran1200pm_time)), 
                                        od_orig3_edsec3_tran1200pm_time)      

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_edsec_tran1200pm_time, "gmapsraw_od_orig1_edsec_tran1200pm_time.csv") 
write.csv (od_orig2_edsec_tran1200pm_time, "gmapsraw_od_orig2_edsec_tran1200pm_time.csv") 
write.csv (od_orig3_edsec_tran1200pm_time, "gmapsraw_od_orig3_edsec_tran1200pm_time.csv") 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec_tran1200pm_time$Minimum <- apply(od_orig1_edsec_tran1200pm_time[c(1:25),c(2:60)], 
                                                1, FUN=min, na.rm=TRUE)
od_orig2_edsec_tran1200pm_time$Minimum <- apply(od_orig2_edsec_tran1200pm_time[c(1:25),c(2:60)], 
                                                1, FUN=min, na.rm=TRUE)
od_orig3_edsec_tran1200pm_time$Minimum <- apply(od_orig3_edsec_tran1200pm_time[c(1:22),c(2:60)], 
                                                1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_edsec_tran1200pm_time_min <- od_orig1_edsec_tran1200pm_time[c(1:25),c(1, 61)]
od_orig2_edsec_tran1200pm_time_min <- od_orig2_edsec_tran1200pm_time[c(1:25),c(1, 61)]
od_orig3_edsec_tran1200pm_time_min <- od_orig3_edsec_tran1200pm_time[c(1:22),c(1, 61)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_near")
colnames(od_orig2_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_near")
colnames(od_orig3_edsec_tran1200pm_time_min) <- c("YX_ORIGIN", "trvtime_edsec_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edsec_tran1200pm_time <- rbind(od_orig1_edsec_tran1200pm_time_min,
                                       od_orig2_edsec_tran1200pm_time_min,
                                       od_orig3_edsec_tran1200pm_time_min)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_edsec_tran1200pm_time$trvtime_edsec_near <- (od_orig_edsec_tran1200pm_time$trvtime_edsec_near/60)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_edsec_tran1200pm_time, "googletransit_od_orig_edsec_tran1200pm_time.csv") 

        
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's public hospitals (10)
dest_health_hosp <- read.csv("destinations_health_fedpub_hosp.csv", header=TRUE)
    yx_dest_hsp <- as.vector(dest_health_hosp[c(1:10),c(11)], mode="character")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_hspt_tran1030am_all = gmapsdistance(origin = yx_org_1,
                                          destination = yx_dest_hsp, 
                                          mode="transit", 
                                          dep_date=dep_date_nextwed, 
                                          dep_time=dep_time_health)

od_orig2_hspt_tran1030am_all = gmapsdistance(origin = yx_org_2,
                                          destination = yx_dest_hsp, 
                                          mode="transit", 
                                          dep_date=dep_date_nextwed, 
                                          dep_time=dep_time_health)

od_orig3_hspt_tran1030am_all = gmapsdistance(origin = yx_org_3,
                                          destination = yx_dest_hsp, 
                                          mode="transit", 
                                          dep_date=dep_date_nextwed, 
                                          dep_time=dep_time_health)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time <- od_orig1_hspt_tran1030am_all$Time
od_orig2_hspt_tran1030am_time <- od_orig2_hspt_tran1030am_all$Time
od_orig3_hspt_tran1030am_time <- od_orig3_hspt_tran1030am_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_hspt_tran1030am_time <- rbind(od_orig1_hspt_tran1030am_time, 
                                      od_orig2_hspt_tran1030am_time,
                                      od_orig3_hspt_tran1030am_time)

write.csv (od_orig_hspt_tran1030am_time, "gmapsraw_od_orig_hspt_tran1030am_time.csv") 



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time$Minimum <- apply(od_orig1_hspt_tran1030am_time[c(1:25),c(2:11)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig2_hspt_tran1030am_time$Minimum <- apply(od_orig2_hspt_tran1030am_time[c(1:25),c(2:11)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig3_hspt_tran1030am_time$Minimum <- apply(od_orig3_hspt_tran1030am_time[c(1:22),c(2:11)], 
                                              1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_hspt_tran1030am_time_min <- od_orig1_hspt_tran1030am_time[c(1:25),c(1, 12)]
od_orig2_hspt_tran1030am_time_min <- od_orig2_hspt_tran1030am_time[c(1:25),c(1, 12)]
od_orig3_hspt_tran1030am_time_min <- od_orig3_hspt_tran1030am_time[c(1:22),c(1, 12)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig2_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")
colnames(od_orig3_hspt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_hspt_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_hspt_tran1030am_time <- rbind(od_orig1_hspt_tran1030am_time_min, 
                                     od_orig2_hspt_tran1030am_time_min,
                                     od_orig3_hspt_tran1030am_time_min)
write.csv (od_orig_hspt_tran1030am_time, "googletransit_od_orig_hspt_tran1030am_time.csv") 
    
#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's public diag/treatment centers (51)
dest_health_diagtrat <- read.csv("destinations_health_fedpub_diagtreat.csv", header=TRUE)
    yx_dest_dgntrt1 <- as.vector(dest_health_diagtrat[c(1:25),c(13)], mode="character")
    yx_dest_dgntrt2 <- as.vector(dest_health_diagtrat[c(26:50),c(13)], mode="character")
    yx_dest_dgntrt3 <- as.vector(dest_health_diagtrat[c(51:51),c(13)], mode="character")
    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig1_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig1_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_1,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

od_orig2_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig2_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig2_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_2,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)

od_orig3_dgntrt1_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt1, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig3_dgntrt2_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt2, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)
od_orig3_dgntrt3_tran1030am_all = gmapsdistance(origin = yx_org_3,destination = yx_dest_dgntrt3, mode="transit", dep_date=dep_date_nextwed, dep_time=dep_time_health)


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

od_orig3_dgntrt_tran1030am_time <- merge((temp3 <- merge(od_orig3_dgntrt1_tran1030am_time, 
                                                         od_orig3_dgntrt2_tran1030am_time)), 
                                         od_orig3_dgntrt3_tran1030am_time)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig1_dgntrt_tran1030am_time, "gmapsraw_od_orig1_dgntrt_tran1030am_time.csv") 
write.csv (od_orig2_dgntrt_tran1030am_time, "gmapsraw_od_orig2_dgntrt_tran1030am_time.csv") 
write.csv (od_orig3_dgntrt_tran1030am_time, "gmapsraw_od_orig3_dgntrt_tran1030am_time.csv") 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_dgntrt_tran1030am_time$Minimum <- apply(od_orig1_dgntrt_tran1030am_time[c(1:25),c(2:52)], 
                                              1, FUN=min, na.rm=TRUE)
od_orig2_dgntrt_tran1030am_time$Minimum <- apply(od_orig2_dgntrt_tran1030am_time[c(1:25),c(2:52)], 
                                                 1, FUN=min, na.rm=TRUE)
od_orig3_dgntrt_tran1030am_time$Minimum <- apply(od_orig3_dgntrt_tran1030am_time[c(1:22),c(2:52)], 
                                                 1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_dgntrt_tran1030am_time_min <- od_orig1_dgntrt_tran1030am_time[c(1:25),c(1, 53)]
od_orig2_dgntrt_tran1030am_time_min <- od_orig2_dgntrt_tran1030am_time[c(1:25),c(1, 53)]
od_orig3_dgntrt_tran1030am_time_min <- od_orig3_dgntrt_tran1030am_time[c(1:22),c(1, 53)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")
colnames(od_orig2_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")
colnames(od_orig3_dgntrt_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_dgntrt_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_dgntrt_tran1030am_time <- rbind(od_orig1_dgntrt_tran1030am_time_min,
                                        od_orig2_dgntrt_tran1030am_time_min,
                                        od_orig3_dgntrt_tran1030am_time_min)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_dgntrt_tran1030am_time$trvtime_dgntrt_near <- (od_orig_dgntrt_tran1030am_time$trvtime_dgntrt_near/60)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
write.csv (od_orig_dgntrt_tran1030am_time, "googletransit_od_orig_dgntrt_tran1030am_time.csv") 


#------------------------------------------------------------------------------------------------
#Import CSV containing YX destination data for Pilar's UPAs (6)
dest_health_upa <- read.csv("destinations_health_provpub_upa.csv", header=TRUE)
    yx_dest_upa <- as.vector(dest_health_upa[c(1:6),c(16)], mode="character")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
od_orig1_upa_tran0700am_all = gmapsdistance(origin = yx_org_1,
                                              destination = yx_dest_upa, 
                                              mode="transit", 
                                              dep_date=dep_date_nextwed, 
                                              dep_time=dep_time_health)
od_orig2_upa_tran0700am_all = gmapsdistance(origin = yx_org_2,
                                              destination = yx_dest_upa, 
                                              mode="transit", 
                                              dep_date=dep_date_nextwed, 
                                              dep_time=dep_time_health)
od_orig3_upa_tran0700am_all = gmapsdistance(origin = yx_org_3,
                                              destination = yx_dest_upa, 
                                              mode="transit", 
                                              dep_date=dep_date_nextwed, 
                                              dep_time=dep_time_health)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time <- od_orig1_upa_tran0700am_all$Time
od_orig2_upa_tran1030am_time <- od_orig2_upa_tran0700am_all$Time
od_orig3_upa_tran1030am_time <- od_orig3_upa_tran0700am_all$Time

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_upa_tran1030am_time <- rbind(od_orig1_upa_tran1030am_time, 
                                      od_orig2_upa_tran1030am_time,
                                      od_orig3_upa_tran1030am_time)

write.csv (od_orig_upa_tran1030am_time, "gmapsraw_od_orig_upa_tran1030am_time.csv") 


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time$Minimum <- apply(od_orig1_upa_tran1030am_time[c(1:25),c(2:7)], 
                                            1, FUN=min, na.rm=TRUE)
od_orig2_upa_tran1030am_time$Minimum <- apply(od_orig2_upa_tran1030am_time[c(1:25),c(2:7)], 
                                            1, FUN=min, na.rm=TRUE)
od_orig3_upa_tran1030am_time$Minimum <- apply(od_orig3_upa_tran1030am_time[c(1:22),c(2:7)], 
                                            1, FUN=min, na.rm=TRUE)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig1_upa_tran1030am_time_min <- od_orig1_upa_tran1030am_time[c(1:25),c(1, 8)]
od_orig2_upa_tran1030am_time_min <- od_orig2_upa_tran1030am_time[c(1:25),c(1, 8)]
od_orig3_upa_tran1030am_time_min <- od_orig3_upa_tran1030am_time[c(1:22),c(1, 8)]

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(od_orig1_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig2_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")
colnames(od_orig3_upa_tran1030am_time_min) <- c("YX_ORIGIN", "trvtime_upa_near")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
od_orig_upa_tran1030am_time <- rbind(od_orig1_upa_tran1030am_time_min, 
                                   od_orig2_upa_tran1030am_time_min,
                                   od_orig3_upa_tran1030am_time_min)
write.csv (od_orig_upa_tran1030am_time, "googletransit_od_orig_upa_tran1030am_time.csv") 

