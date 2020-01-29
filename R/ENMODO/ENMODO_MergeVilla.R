setwd("~/Desktop/CSV")

#---------------------------------------------------------------------------------------------
hogares_values <- read.csv("ValueLabel_Hogares.csv", header=TRUE)
hogares_joined <- read.csv("Joined_Hogares.csv", header=TRUE)
    hogares_joined_villa <- hogares_joined[ ,c(26,27)]
    

    
hogares_values_villa <- merge(hogares_values, hogares_joined_villa)
    write.csv(hogares_values_villa, "ValueLabel_Hogares_VillaStatusAdded.csv")
    
    
    
    
    
    

    hogares_values_villa_yes <- hogares_values_villa[ which(hogares_values_villa$ASENT_YN=="1"),]

    hogares_values_villa_no <- hogares_values_villa[ which(hogares_values_villa$ASENT_YN=="0"),]

    
  hogares_values_lamatanza <- hogares_values_villa[ which(hogares_values_villa$PARTIDO=="La Matanza"),]
  
  
    hogares_values_lamatanza_villa <- hogares_values_lamatanza[ which(hogares_values_lamatanza$ASENT_YN=="1"),]
    
    
    hogares_values_lamatanza_non <- hogares_values_lamatanza[ which(hogares_values_lamatanza$ASENT_YN=="0"),]
    
    
     
  hogares_values_pilar <- hogares_values_villa[ which(hogares_values_villa$PARTIDO=="Pilar"),]
  
  
    hogares_values_pilar_villa <- hogares_values_pilar[ which(hogares_values_pilar$ASENT_YN=="1"),]
    
    
    hogares_values_pilar_non <- hogares_values_pilar[ which(hogares_values_pilar$ASENT_YN=="0"),]
    
    
  
  hogares_values_quilmes <- hogares_values_villa[ which(hogares_values_villa$PARTIDO=="Quilmes"),]
  
  
    hogares_values_quilmes_villa <- hogares_values_quilmes[ which(hogares_values_quilmes$ASENT_YN=="1"),]
    
    
    hogares_values_quilmes_non <- hogares_values_quilmes[ which(hogares_values_quilmes$ASENT_YN=="0"),]
    
    
    
    
    
    
    
    
#---------------------------------------------------------------------------------------------
personas_values <- read.csv("ValueLabel_Personas.csv", header=TRUE)
personas_joined <- read.csv("Joined_Personas.csv", header=TRUE)
    personas_joined_villa <- personas_joined[ ,c(34,35)]

personas_values_villa <- merge(personas_values, personas_joined_villa)
    write.csv(personas_values_villa, "ValueLabel_Personas_WithVillaStatus.csv")



    personas_values_lamatanza <- personas_values_villa[ which(personas_values_villa$PARTIDO=="La Matanza"),]
    
    personas_values_pilar <- personas_values_villa[ which(personas_values_villa$PARTIDO=="Pilar"),]
    
    personas_values_quilmes <- personas_values_villa[ which(personas_values_villa$PARTIDO=="Quilmes"),]



    
    
    
    
    
#---------------------------------------------------------------------------------------------    
viajes_values <- read.csv("ValueLabel_Viajes.csv", header=TRUE)
viajes_joined <- read.csv("Joined_Viajes.csv", header=TRUE)
    viajes_joined_villa <- viajes_joined[ ,c(24,25)]   

viajes_values_villa <- merge(viajes_values, viajes_joined_villa)
write.csv(viajes_values_villa, "ValueLabel_Viajes_WithVillaStatus.csv")


    viajes_values_lamatanza <- viajes_values_villa[ which(viajes_values_villa$partido=="La Matanza"),]
    
    viajes_values_pilar <- viajes_values_villa[ which(viajes_values_villa$partido=="Pilar"),]
    
    viajes_values_quilmes <- viajes_values_villa[ which(viajes_values_villa$partido=="Quilmes"),]
    

    
    

    
#---------------------------------------------------------------------------------------------        
etapas_values <- read.csv("ValueLabel_Etapas.csv", header=TRUE)
etapas_joined <- read.csv("Joined_Etapas.csv", header=TRUE)    
    etapas_joined_villa <- etapas_joined[ ,c(41,74)]      
    
etapas_values_villa <- merge(etapas_values, etapas_joined_villa)
write.csv(etapas_values_villa, "ValueLabel_Etapas_WithVillaStatus.csv")


    etapas_values_lamatanza <- etapas_values_villa[ which(etapas_values_villa$partido=="La Matanza"),]
    
    etapas_values_pilar <- etapas_values_villa[ which(etapas_values_villa$partido=="Pilar"),]
    
    etapas_values_quilmes <- etapas_values_villa[ which(etapas_values_villa$partido=="Quilmes"),]
    

    
    
    
    
