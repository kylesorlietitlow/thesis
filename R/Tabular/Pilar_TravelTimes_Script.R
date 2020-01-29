#Clear the list
rm(list=ls())

setwd("D:/Thesis/R/CaseStudy_Pilar")

traveltimes <- read.csv("origins_radios_all_traveltimes.csv", header=TRUE, na.string = TRUE)

traveltimes$z_trvtime_cbd_bsas <- scale(traveltimes$trvtime_cbd_bsas)
traveltimes$z_trvtime_cbd_local <- scale(traveltimes$trvtime_cbd_local)
traveltimes$z_trvtime_cbd_ngh_min <- scale(traveltimes$trvtime_cbd_ngh_min)

traveltimes$z_trvtime_rail_near <- scale(traveltimes$trvtime_rail_near)

traveltimes$z_trvtime_hspt_min <- scale(traveltimes$trvtime_hspt_min)
traveltimes$z_trvtime_upa_min <- scale(traveltimes$trvtime_upa_min)
traveltimes$z_trvtime_dgntrt_near <- scale(traveltimes$trvtime_dgntrt_near)

traveltimes$z_trvtime_edknd_near <- scale(traveltimes$trvtime_edknd_near)
traveltimes$z_trvtime_edsec_near <- scale(traveltimes$trvtime_edsec_near)
traveltimes$z_trvtime_edprm_min <- scale(traveltimes$trvtime_edprm_min)


traveltimes$z_mean_null <- rowMeans(traveltimes[, 16:25], na.rm=FALSE)

traveltimes$z_mean_cbd_null <- rowMeans(traveltimes[, 16:18], na.rm=FALSE)
traveltimes$z_mean_health_null <- rowMeans(traveltimes[, 20:22], na.rm=FALSE)
traveltimes$z_mean_ed_null <- rowMeans(traveltimes[, 23:25], na.rm=FALSE)

traveltimes$z_mean <- rowMeans(traveltimes[, 16:25], na.rm=TRUE)
