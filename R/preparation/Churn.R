datostrain<-read.csv("./R/preparation/Datos_Churn_train.csv",sep=",",dec=".",header=T,colClasses = c("character","character","character","numeric","factor","factor","numeric","character","numeric","numeric","factor","factor","numeric","factor"))


datostest<-read.csv("./R/preparation/Datos_Churn_test.csv",sep=",",dec=".",header=T,colClasses = c("character","character","character","numeric","factor","factor","numeric","character","numeric","numeric","factor","factor","numeric","factor"))



Churn<-rbind(datostrain,datostest)
write.csv(Churn,"./data/raw/Churn.csv")
