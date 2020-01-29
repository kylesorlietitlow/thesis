rm(list=ls())

setwd("D:/Thesis/R/INDEC")

amba24 <- read.csv("amba24.csv", header=TRUE)
    amba24_avg <- as.data.frame(colMeans(amba24, na.rm=TRUE))
    setDT(amba24_avg, keep.rownames=TRUE)
    
    
    
#----------------------------------------------------------------------------------------------------------------------    
    
amba24_caba <- amba24[amba24$CABA_YN=="1", ]
    amba24_caba_avg <- as.data.frame(colMeans(amba24_caba, na.rm=TRUE))
    setDT(amba24_caba_avg, keep.rownames=TRUE)
    
amba24_prov <- amba24[amba24$CABA_YN!="1", ]
    amba24_prov_avg <- as.data.frame(colMeans(amba24_prov, na.rm=TRUE))
    setDT(amba24_prov_avg, keep.rownames=TRUE)

amba24_gaba <- amba24[amba24$GABA_YN=="1", ]
    amba24_gaba_avg <- as.data.frame(colMeans(amba24_gaba, na.rm=TRUE))
    setDT(amba24_gaba_avg, keep.rownames=TRUE)
    
    
    
    
    

amba24_urb1 <- amba24[amba24$AMBA_ZONE1_YN=="1", ]
    amba24_urb1_avg <- as.data.frame(colMeans(amba24_urb1, na.rm=TRUE))
    setDT(amba24_urb1_avg, keep.rownames=TRUE)
    
amba24_urb2 <- amba24[amba24$AMBA_ZONE2_YN=="1", ]
    amba24_urb2_avg <- as.data.frame(colMeans(amba24_urb2, na.rm=TRUE))
    setDT(amba24_urb2_avg, keep.rownames=TRUE)
    
amba24_urb3 <- amba24[amba24$AMBA_ZONE3_YN=="1", ]
    amba24_urb3_avg <- as.data.frame(colMeans(amba24_urb3, na.rm=TRUE))
    setDT(amba24_urb3_avg, keep.rownames=TRUE)

    
    
    
    
amba24_asent_none <- amba24[amba24$ASENTNON_YN=="1", ]
    amba24_asent_none_avg <- as.data.frame(colMeans(amba24_asent_none, na.rm=TRUE))
    setDT(amba24_asent_none_avg, keep.rownames=TRUE)
    
amba24_asent_any <- amba24[amba24$ASENTANY_YN=="1", ]
    amba24_asent_any_avg <- as.data.frame(colMeans(amba24_asent_any, na.rm=TRUE))
    setDT(amba24_asent_any_avg, keep.rownames=TRUE)
    
amba24_asent_maj <- amba24[amba24$ASENT_MAJ_YN=="1", ]
    amba24_asent_maj_avg <- as.data.frame(colMeans(amba24_asent_maj, na.rm=TRUE))
    setDT(amba24_asent_maj_avg, keep.rownames=TRUE)
    
amba24_asent_min <- amba24[amba24$ASENTMIN_YN=="1", ]
    amba24_asent_min_avg <- as.data.frame(colMeans(amba24_asent_min, na.rm=TRUE))
    setDT(amba24_asent_min_avg, keep.rownames=TRUE)

    

    temp01 <- merge(amba24_asent_any_avg, amba24_asent_maj_avg)
    temp02 <- merge(temp01, amba24_asent_min_avg)
    temp03 <- merge(temp02, amba24_asent_none_avg)
    temp04 <- merge(temp03, amba24_caba_avg)
    temp05 <- merge(temp04, amba24_gaba_avg)
    temp06 <- merge(temp05, amba24_prov_avg)
    temp07 <- merge(temp06, amba24_urb1_avg)
    temp08 <- merge(temp07, amba24_urb2_avg)
    temp09 <- merge(temp08, amba24_urb3_avg)
amba24_means <- merge(temp09, amba24_avg)
    
write.csv(amba24_means, "amba24_means.csv") 
    
    






    

#-----------------------------------------------------------------------------------------------------------------

study3_all <- amba24[amba24$SAMPLEN3_YN=="1", ]
  study3_all_avg <- as.data.frame(colMeans(study3_all, na.rm=TRUE))
  setDT(study3_all_avg, keep.rownames=TRUE)


  
  
  
  study3_all_asent_none <- study3_all[study3_all$ASENTNON_YN=="1", ]
    study3_all_asent_none_avg <- as.data.frame(colMeans(study3_all_asent_none, na.rm=TRUE))
    setDT(study3_all_asent_none_avg, keep.rownames=TRUE)
    
      study3_all_asent_none_incl <- study3_all_asent_none[study3_all_asent_none$TRAVELTIME_YN=="1", ]
        study3_all_asent_none_incl_avg <- as.data.frame(colMeans(study3_all_asent_none_incl, na.rm=TRUE))
        setDT(study3_all_asent_none_incl_avg, keep.rownames=TRUE)
        
      study3_all_asent_none_excl <- study3_all_asent_none[study3_all_asent_none$TRAVELTIME_YN=="0", ]
        study3_all_asent_none_excl_avg <- as.data.frame(colMeans(study3_all_asent_none_excl, na.rm=TRUE))
        setDT(study3_all_asent_none_excl_avg, keep.rownames=TRUE)
  
  

        
        
        
        
        
          
  study3_all_asent_any <- study3_all[study3_all$ASENTANY_YN=="1", ]
    study3_all_asent_any_avg <- as.data.frame(colMeans(study3_all_asent_any, na.rm=TRUE))
    setDT(study3_all_asent_any_avg, keep.rownames=TRUE)
          
      study3_all_asent_any_incl <- study3_all_asent_any[study3_all_asent_any$TRAVELTIME_YN=="1", ]
        study3_all_asent_any_incl_avg <- as.data.frame(colMeans(study3_all_asent_any_incl, na.rm=TRUE))
        setDT(study3_all_asent_any_incl_avg, keep.rownames=TRUE)
          
      study3_all_asent_any_excl <- study3_all_asent_any[study3_all_asent_any$TRAVELTIME_YN=="0", ]
        study3_all_asent_any_excl_avg <- as.data.frame(colMeans(study3_all_asent_any_excl, na.rm=TRUE))
        setDT(study3_all_asent_any_excl_avg, keep.rownames=TRUE)  
  
        
        
        
        

        
          
  
  study3_all_asent_maj <- study3_all[study3_all$ASENT_MAJ_YN=="1", ]
    study3_all_asent_maj_avg <- as.data.frame(colMeans(study3_all_asent_maj, na.rm=TRUE))
    setDT(study3_all_asent_maj_avg, keep.rownames=TRUE)
        
      study3_all_asent_maj_incl <- study3_all_asent_maj[study3_all_asent_maj$TRAVELTIME_YN=="1", ]
        study3_all_asent_maj_incl_avg <- as.data.frame(colMeans(study3_all_asent_maj_incl, na.rm=TRUE))
        setDT(study3_all_asent_maj_incl_avg, keep.rownames=TRUE)
        
      study3_all_asent_maj_excl <- study3_all_asent_maj[study3_all_asent_maj$TRAVELTIME_YN=="0", ]
        study3_all_asent_maj_excl_avg <- as.data.frame(colMeans(study3_all_asent_maj_excl, na.rm=TRUE))
        setDT(study3_all_asent_maj_excl_avg, keep.rownames=TRUE)  
  
 
        
        
        
        
        
         
  study3_all_asent_min <- study3_all[study3_all$ASENTMIN_YN=="1", ]
    study3_all_asent_min_avg <- as.data.frame(colMeans(study3_all_asent_min, na.rm=TRUE))
    setDT(study3_all_asent_min_avg, keep.rownames=TRUE)
        
      study3_all_asent_min_incl <- study3_all_asent_min[study3_all_asent_min$TRAVELTIME_YN=="1", ]
        study3_all_asent_min_incl_avg <- as.data.frame(colMeans(study3_all_asent_min_incl, na.rm=TRUE))
        setDT(study3_all_asent_min_incl_avg, keep.rownames=TRUE)
        
      study3_all_asent_min_excl <- study3_all_asent_min[study3_all_asent_min$TRAVELTIME_YN=="0", ]
        study3_all_asent_min_excl_avg <- as.data.frame(colMeans(study3_all_asent_min_excl, na.rm=TRUE))
        setDT(study3_all_asent_min_excl_avg, keep.rownames=TRUE) 

  
        temp01 <- merge(study3_all_avg, study3_all_asent_none_avg)
        temp02 <- merge(temp01, study3_all_asent_none_incl_avg)
        temp03 <- merge(temp02, study3_all_asent_none_excl_avg)
        temp04 <- merge(temp03, study3_all_asent_any_avg)
        temp05 <- merge(temp04, study3_all_asent_any_incl_avg)
        temp06 <- merge(temp05, study3_all_asent_any_excl_avg)
        temp07 <- merge(temp06, study3_all_asent_min_avg)
        temp08 <- merge(temp07, study3_all_asent_min_incl_avg)
        temp09 <- merge(temp08, study3_all_asent_min_excl_avg)
        temp10 <- merge(temp09, study3_all_asent_maj_avg)
        temp11 <- merge(temp10, study3_all_asent_maj_incl_avg)
    study3_all_means <- merge(temp11, study3_all_asent_maj_excl_avg)
        
write.csv(study3_all_means, "study3_all_means.csv") 
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        

#-----------------------------------------------------------------------------------------------------------------

study3_lamatanza <- amba24[amba24$LAMATANZA_YN
                          =="1", ]
study3_lamatanza_avg <- as.data.frame(colMeans(study3_lamatanza, na.rm=TRUE))
setDT(study3_lamatanza_avg, keep.rownames=TRUE)





study3_lamatanza_asent_none <- study3_lamatanza[study3_lamatanza$ASENTNON_YN=="1", ]
study3_lamatanza_asent_none_avg <- as.data.frame(colMeans(study3_lamatanza_asent_none, na.rm=TRUE))
setDT(study3_lamatanza_asent_none_avg, keep.rownames=TRUE)

study3_lamatanza_asent_none_incl <- study3_lamatanza_asent_none[study3_lamatanza_asent_none$TRAVELTIME_YN=="1", ]
study3_lamatanza_asent_none_incl_avg <- as.data.frame(colMeans(study3_lamatanza_asent_none_incl, na.rm=TRUE))
setDT(study3_lamatanza_asent_none_incl_avg, keep.rownames=TRUE)

study3_lamatanza_asent_none_excl <- study3_lamatanza_asent_none[study3_lamatanza_asent_none$TRAVELTIME_YN=="0", ]
study3_lamatanza_asent_none_excl_avg <- as.data.frame(colMeans(study3_lamatanza_asent_none_excl, na.rm=TRUE))
setDT(study3_lamatanza_asent_none_excl_avg, keep.rownames=TRUE)









study3_lamatanza_asent_any <- study3_lamatanza[study3_lamatanza$ASENTANY_YN=="1", ]
study3_lamatanza_asent_any_avg <- as.data.frame(colMeans(study3_lamatanza_asent_any, na.rm=TRUE))
setDT(study3_lamatanza_asent_any_avg, keep.rownames=TRUE)

study3_lamatanza_asent_any_incl <- study3_lamatanza_asent_any[study3_lamatanza_asent_any$TRAVELTIME_YN=="1", ]
study3_lamatanza_asent_any_incl_avg <- as.data.frame(colMeans(study3_lamatanza_asent_any_incl, na.rm=TRUE))
setDT(study3_lamatanza_asent_any_incl_avg, keep.rownames=TRUE)

study3_lamatanza_asent_any_excl <- study3_lamatanza_asent_any[study3_lamatanza_asent_any$TRAVELTIME_YN=="0", ]
study3_lamatanza_asent_any_excl_avg <- as.data.frame(colMeans(study3_lamatanza_asent_any_excl, na.rm=TRUE))
setDT(study3_lamatanza_asent_any_excl_avg, keep.rownames=TRUE)  









study3_lamatanza_asent_maj <- study3_lamatanza[study3_lamatanza$ASENT_MAJ_YN=="1", ]
study3_lamatanza_asent_maj_avg <- as.data.frame(colMeans(study3_lamatanza_asent_maj, na.rm=TRUE))
setDT(study3_lamatanza_asent_maj_avg, keep.rownames=TRUE)

study3_lamatanza_asent_maj_incl <- study3_lamatanza_asent_maj[study3_lamatanza_asent_maj$TRAVELTIME_YN=="1", ]
study3_lamatanza_asent_maj_incl_avg <- as.data.frame(colMeans(study3_lamatanza_asent_maj_incl, na.rm=TRUE))
setDT(study3_lamatanza_asent_maj_incl_avg, keep.rownames=TRUE)

study3_lamatanza_asent_maj_excl <- study3_lamatanza_asent_maj[study3_lamatanza_asent_maj$TRAVELTIME_YN=="0", ]
study3_lamatanza_asent_maj_excl_avg <- as.data.frame(colMeans(study3_lamatanza_asent_maj_excl, na.rm=TRUE))
setDT(study3_lamatanza_asent_maj_excl_avg, keep.rownames=TRUE)  








study3_lamatanza_asent_min <- study3_lamatanza[study3_lamatanza$ASENTMIN_YN=="1", ]
study3_lamatanza_asent_min_avg <- as.data.frame(colMeans(study3_lamatanza_asent_min, na.rm=TRUE))
setDT(study3_lamatanza_asent_min_avg, keep.rownames=TRUE)

study3_lamatanza_asent_min_incl <- study3_lamatanza_asent_min[study3_lamatanza_asent_min$TRAVELTIME_YN=="1", ]
study3_lamatanza_asent_min_incl_avg <- as.data.frame(colMeans(study3_lamatanza_asent_min_incl, na.rm=TRUE))
setDT(study3_lamatanza_asent_min_incl_avg, keep.rownames=TRUE)

study3_lamatanza_asent_min_excl <- study3_lamatanza_asent_min[study3_lamatanza_asent_min$TRAVELTIME_YN=="0", ]
study3_lamatanza_asent_min_excl_avg <- as.data.frame(colMeans(study3_lamatanza_asent_min_excl, na.rm=TRUE))
setDT(study3_lamatanza_asent_min_excl_avg, keep.rownames=TRUE) 


temp01 <- merge(study3_lamatanza_avg, study3_lamatanza_asent_none_avg)
temp02 <- merge(temp01, study3_lamatanza_asent_none_incl_avg)
temp03 <- merge(temp02, study3_lamatanza_asent_none_excl_avg)
temp04 <- merge(temp03, study3_lamatanza_asent_any_avg)
temp05 <- merge(temp04, study3_lamatanza_asent_any_incl_avg)
temp06 <- merge(temp05, study3_lamatanza_asent_any_excl_avg)
temp07 <- merge(temp06, study3_lamatanza_asent_min_avg)
temp08 <- merge(temp07, study3_lamatanza_asent_min_incl_avg)
temp09 <- merge(temp08, study3_lamatanza_asent_min_excl_avg)
temp10 <- merge(temp09, study3_lamatanza_asent_maj_avg)
temp11 <- merge(temp10, study3_lamatanza_asent_maj_incl_avg)
study3_lamatanza_means <- merge(temp11, study3_lamatanza_asent_maj_excl_avg)

write.csv(study3_lamatanza_means, "study3_lamatanza_means.csv") 

#-----------------------------------------------------------------------------------------------------------------

study3_quilmes <- amba24[amba24$QUILMES_YN=="1", ]
study3_quilmes_avg <- as.data.frame(colMeans(study3_quilmes, na.rm=TRUE))
setDT(study3_quilmes_avg, keep.rownames=TRUE)





study3_quilmes_asent_none <- study3_quilmes[study3_quilmes$ASENTNON_YN=="1", ]
study3_quilmes_asent_none_avg <- as.data.frame(colMeans(study3_quilmes_asent_none, na.rm=TRUE))
setDT(study3_quilmes_asent_none_avg, keep.rownames=TRUE)

study3_quilmes_asent_none_incl <- study3_quilmes_asent_none[study3_quilmes_asent_none$TRAVELTIME_YN=="1", ]
study3_quilmes_asent_none_incl_avg <- as.data.frame(colMeans(study3_quilmes_asent_none_incl, na.rm=TRUE))
setDT(study3_quilmes_asent_none_incl_avg, keep.rownames=TRUE)

study3_quilmes_asent_none_excl <- study3_quilmes_asent_none[study3_quilmes_asent_none$TRAVELTIME_YN=="0", ]
study3_quilmes_asent_none_excl_avg <- as.data.frame(colMeans(study3_quilmes_asent_none_excl, na.rm=TRUE))
setDT(study3_quilmes_asent_none_excl_avg, keep.rownames=TRUE)









study3_quilmes_asent_any <- study3_quilmes[study3_quilmes$ASENTANY_YN=="1", ]
study3_quilmes_asent_any_avg <- as.data.frame(colMeans(study3_quilmes_asent_any, na.rm=TRUE))
setDT(study3_quilmes_asent_any_avg, keep.rownames=TRUE)

study3_quilmes_asent_any_incl <- study3_quilmes_asent_any[study3_quilmes_asent_any$TRAVELTIME_YN=="1", ]
study3_quilmes_asent_any_incl_avg <- as.data.frame(colMeans(study3_quilmes_asent_any_incl, na.rm=TRUE))
setDT(study3_quilmes_asent_any_incl_avg, keep.rownames=TRUE)

study3_quilmes_asent_any_excl <- study3_quilmes_asent_any[study3_quilmes_asent_any$TRAVELTIME_YN=="0", ]
study3_quilmes_asent_any_excl_avg <- as.data.frame(colMeans(study3_quilmes_asent_any_excl, na.rm=TRUE))
setDT(study3_quilmes_asent_any_excl_avg, keep.rownames=TRUE)  









study3_quilmes_asent_maj <- study3_quilmes[study3_quilmes$ASENT_MAJ_YN=="1", ]
study3_quilmes_asent_maj_avg <- as.data.frame(colMeans(study3_quilmes_asent_maj, na.rm=TRUE))
setDT(study3_quilmes_asent_maj_avg, keep.rownames=TRUE)

study3_quilmes_asent_maj_incl <- study3_quilmes_asent_maj[study3_quilmes_asent_maj$TRAVELTIME_YN=="1", ]
study3_quilmes_asent_maj_incl_avg <- as.data.frame(colMeans(study3_quilmes_asent_maj_incl, na.rm=TRUE))
setDT(study3_quilmes_asent_maj_incl_avg, keep.rownames=TRUE)

study3_quilmes_asent_maj_excl <- study3_quilmes_asent_maj[study3_quilmes_asent_maj$TRAVELTIME_YN=="0", ]
study3_quilmes_asent_maj_excl_avg <- as.data.frame(colMeans(study3_quilmes_asent_maj_excl, na.rm=TRUE))
setDT(study3_quilmes_asent_maj_excl_avg, keep.rownames=TRUE)  








study3_quilmes_asent_min <- study3_quilmes[study3_quilmes$ASENTMIN_YN=="1", ]
study3_quilmes_asent_min_avg <- as.data.frame(colMeans(study3_quilmes_asent_min, na.rm=TRUE))
setDT(study3_quilmes_asent_min_avg, keep.rownames=TRUE)

study3_quilmes_asent_min_incl <- study3_quilmes_asent_min[study3_quilmes_asent_min$TRAVELTIME_YN=="1", ]
study3_quilmes_asent_min_incl_avg <- as.data.frame(colMeans(study3_quilmes_asent_min_incl, na.rm=TRUE))
setDT(study3_quilmes_asent_min_incl_avg, keep.rownames=TRUE)

study3_quilmes_asent_min_excl <- study3_quilmes_asent_min[study3_quilmes_asent_min$TRAVELTIME_YN=="0", ]
study3_quilmes_asent_min_excl_avg <- as.data.frame(colMeans(study3_quilmes_asent_min_excl, na.rm=TRUE))
setDT(study3_quilmes_asent_min_excl_avg, keep.rownames=TRUE) 


temp01 <- merge(study3_quilmes_avg, study3_quilmes_asent_none_avg)
temp02 <- merge(temp01, study3_quilmes_asent_none_incl_avg)
temp03 <- merge(temp02, study3_quilmes_asent_none_excl_avg)
temp04 <- merge(temp03, study3_quilmes_asent_any_avg)
temp05 <- merge(temp04, study3_quilmes_asent_any_incl_avg)
temp06 <- merge(temp05, study3_quilmes_asent_any_excl_avg)
temp07 <- merge(temp06, study3_quilmes_asent_min_avg)
temp08 <- merge(temp07, study3_quilmes_asent_min_incl_avg)
temp09 <- merge(temp08, study3_quilmes_asent_min_excl_avg)
temp10 <- merge(temp09, study3_quilmes_asent_maj_avg)
temp11 <- merge(temp10, study3_quilmes_asent_maj_incl_avg)
study3_quilmes_means <- merge(temp11, study3_quilmes_asent_maj_excl_avg)

write.csv(study3_quilmes_means, "study3_quilmes_means.csv") 


#-----------------------------------------------------------------------------------------------------------------

study3_pilar <- amba24[amba24$PILAR_YN=="1", ]
study3_pilar_avg <- as.data.frame(colMeans(study3_pilar, na.rm=TRUE))
setDT(study3_pilar_avg, keep.rownames=TRUE)





study3_pilar_asent_none <- study3_pilar[study3_pilar$ASENTNON_YN=="1", ]
study3_pilar_asent_none_avg <- as.data.frame(colMeans(study3_pilar_asent_none, na.rm=TRUE))
setDT(study3_pilar_asent_none_avg, keep.rownames=TRUE)

study3_pilar_asent_none_incl <- study3_pilar_asent_none[study3_pilar_asent_none$TRAVELTIME_YN=="1", ]
study3_pilar_asent_none_incl_avg <- as.data.frame(colMeans(study3_pilar_asent_none_incl, na.rm=TRUE))
setDT(study3_pilar_asent_none_incl_avg, keep.rownames=TRUE)

study3_pilar_asent_none_excl <- study3_pilar_asent_none[study3_pilar_asent_none$TRAVELTIME_YN=="0", ]
study3_pilar_asent_none_excl_avg <- as.data.frame(colMeans(study3_pilar_asent_none_excl, na.rm=TRUE))
setDT(study3_pilar_asent_none_excl_avg, keep.rownames=TRUE)









study3_pilar_asent_any <- study3_pilar[study3_pilar$ASENTANY_YN=="1", ]
study3_pilar_asent_any_avg <- as.data.frame(colMeans(study3_pilar_asent_any, na.rm=TRUE))
setDT(study3_pilar_asent_any_avg, keep.rownames=TRUE)

study3_pilar_asent_any_incl <- study3_pilar_asent_any[study3_pilar_asent_any$TRAVELTIME_YN=="1", ]
study3_pilar_asent_any_incl_avg <- as.data.frame(colMeans(study3_pilar_asent_any_incl, na.rm=TRUE))
setDT(study3_pilar_asent_any_incl_avg, keep.rownames=TRUE)

study3_pilar_asent_any_excl <- study3_pilar_asent_any[study3_pilar_asent_any$TRAVELTIME_YN=="0", ]
study3_pilar_asent_any_excl_avg <- as.data.frame(colMeans(study3_pilar_asent_any_excl, na.rm=TRUE))
setDT(study3_pilar_asent_any_excl_avg, keep.rownames=TRUE)  









study3_pilar_asent_maj <- study3_pilar[study3_pilar$ASENT_MAJ_YN=="1", ]
study3_pilar_asent_maj_avg <- as.data.frame(colMeans(study3_pilar_asent_maj, na.rm=TRUE))
setDT(study3_pilar_asent_maj_avg, keep.rownames=TRUE)

study3_pilar_asent_maj_incl <- study3_pilar_asent_maj[study3_pilar_asent_maj$TRAVELTIME_YN=="1", ]
study3_pilar_asent_maj_incl_avg <- as.data.frame(colMeans(study3_pilar_asent_maj_incl, na.rm=TRUE))
setDT(study3_pilar_asent_maj_incl_avg, keep.rownames=TRUE)

study3_pilar_asent_maj_excl <- study3_pilar_asent_maj[study3_pilar_asent_maj$TRAVELTIME_YN=="0", ]
study3_pilar_asent_maj_excl_avg <- as.data.frame(colMeans(study3_pilar_asent_maj_excl, na.rm=TRUE))
setDT(study3_pilar_asent_maj_excl_avg, keep.rownames=TRUE)  








study3_pilar_asent_min <- study3_pilar[study3_pilar$ASENTMIN_YN=="1", ]
study3_pilar_asent_min_avg <- as.data.frame(colMeans(study3_pilar_asent_min, na.rm=TRUE))
setDT(study3_pilar_asent_min_avg, keep.rownames=TRUE)

study3_pilar_asent_min_incl <- study3_pilar_asent_min[study3_pilar_asent_min$TRAVELTIME_YN=="1", ]
study3_pilar_asent_min_incl_avg <- as.data.frame(colMeans(study3_pilar_asent_min_incl, na.rm=TRUE))
setDT(study3_pilar_asent_min_incl_avg, keep.rownames=TRUE)

study3_pilar_asent_min_excl <- study3_pilar_asent_min[study3_pilar_asent_min$TRAVELTIME_YN=="0", ]
study3_pilar_asent_min_excl_avg <- as.data.frame(colMeans(study3_pilar_asent_min_excl, na.rm=TRUE))
setDT(study3_pilar_asent_min_excl_avg, keep.rownames=TRUE) 


temp01 <- merge(study3_pilar_avg, study3_pilar_asent_none_avg)
temp02 <- merge(temp01, study3_pilar_asent_none_incl_avg)
temp03 <- merge(temp02, study3_pilar_asent_none_excl_avg)
temp04 <- merge(temp03, study3_pilar_asent_any_avg)
temp05 <- merge(temp04, study3_pilar_asent_any_incl_avg)
temp06 <- merge(temp05, study3_pilar_asent_any_excl_avg)
temp07 <- merge(temp06, study3_pilar_asent_min_avg)
temp08 <- merge(temp07, study3_pilar_asent_min_incl_avg)
temp09 <- merge(temp08, study3_pilar_asent_min_excl_avg)
temp10 <- merge(temp09, study3_pilar_asent_maj_avg)
temp11 <- merge(temp10, study3_pilar_asent_maj_incl_avg)
study3_pilar_means <- merge(temp11, study3_pilar_asent_maj_excl_avg)

write.csv(study3_pilar_means, "study3_pilar_means.csv") 

#------------------------------------------------------------------------------------------------------------

amba24 <- read.csv("amba24_means.csv")
study3 <- read.csv("study3_all_means.csv")
study3_lamatanza <- read.csv("study3_lamatanza_means.csv")
study3_pilar <- read.csv("study3_pilar_means.csv")
study3_quilmes <- read.csv("study3_quilmes_means.csv")

temp2a <- merge(amba24, study3)
temp2b <- merge(temp2a, study3_lamatanza)
temp2c <- merge(temp2b, study3_pilar)
indec_means_all <- merge(temp2c, study3_quilmes)

write.csv(indec_means_all, "indec_means_amba24_study3_all.csv")
