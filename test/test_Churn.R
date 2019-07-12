library(testthat)
library(fs) # paquete para interactuar con el sistema de archivos 
library(here) # cuando trabajamos en un proyecto nos permite ubicar el directorio de trabajo.


datos<-read.csv(file = "Churn.csv", row.name=1)

expect_true(is.integer(datos$CantidadProductos))
expect_true(is.integer(datos$TarjetaCredito))
expect_true(is.integer(datos$Activo))
expect_true(is.numeric(datos$SalarioEstimado))



# etiquetemos un conjunto de pruebas
context("Validación de los datos de entrada") 

# creamos una prueba
test_that(desc = "No hay datos en la carpeta ./data/raw",
          code = {
            # lista los archivos .csv
            files <- dir_ls(path = here("data/raw"), glob = "*.csv") 
            expect_true(length(files) >= 1)
          })