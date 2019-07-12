datosACP <- read.table('./data/processed/Churnproceso.csv', header=TRUE, sep=',',dec='.',row.names=1)
res<-PCA(datosACP, scale.unit=TRUE, ncp=5, graph = FALSE)
saveRDS(res,file="./data/processed/modeloACP")



modelo <- hclust(dist(datosACP),method = "complete")
saveRDS(modelo,file="./data/processed/modelohclust")

Grupo<-cutree(modelo,k=13)
NDatos<-cbind(datosACP,Grupo)
write.csv(NDatos,"./data/processed/Ngrupos.csv")



centros<-centers.hclust(datosACP,modelo,nclust=13,use.median=FALSE)
write.csv(centros,"./data/processed/centros.csv")
