#!/bin/Rscript

### analsysis anova GECCO ###

ls()
rm(list=ls())
ls()

setwd("")

#install.packages("sequoia")
library(sequoia)

Geno<-GenoConvert(InFile="03_results/plink.output.raw", InFormat="raw")

# run sequoia - duplicate check & parentage assignment only
# Load lifehistory
lifehistdata<-read.table("01_info_files/lifehistdata.txt",header=T, sep="\t")
ParOUT <- sequoia(GenoM = Geno,LifeHistData = lifehistdata, Complex="full",MaxSibshipSize=100, MaxSibIter = 50)


# run sequoia - sibship clustering & grandparent assignment
# use parents assigned above (in 'ParOUT$PedigreePar')
SeqOUT <- sequoia(GenoM = Geno,SeqList = ParOUT,MaxSibIter = 5)


#Writeresults
write.table(SeqOUT$PedigreePar,file="03_results/result_sibship.txt",quote=F)
write.table(SeqOUT$MaybeParent,file="03_results/result_sibship_maybeparent.txt",quote=F)
