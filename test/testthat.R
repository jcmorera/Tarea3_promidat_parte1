library(testthat)
test_file(path = "./test/test_Churn.R")


install.packages("devtools")
devtools::install_github("rstudio/packrat")
library(packrat)
init()
