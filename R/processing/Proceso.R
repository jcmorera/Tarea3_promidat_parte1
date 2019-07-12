datosproceso<-read.csv("./data/raw/Churn.csv",row.names = 1)

datosproceso<- datosproceso[!is.na(datosproceso$DejaBanco),]

datosproceso<-datosproceso[-c(1,3,5,6,8)]
Churnproceso<-na.omit(datosproceso)

write.csv(Churnproceso,"./data/processed/Churnproceso.csv")
