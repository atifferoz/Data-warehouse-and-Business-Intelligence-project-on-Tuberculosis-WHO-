library(RODBC)
setwd("/Users/USER/Desktop/dwbi data/tb datasets")
country<- read.csv("country.csv",header = T,na.strings = c(""))
country<-country[,c(1,4,6,7)]
country<-country[-c(which(is.na(country$region))),]
colnames(country)<-c("Country_Name","Country_Code","Region","Sub_Region")
ConnString <- odbcDriverConnect("Driver=SQL Server;Server=DELL; Database=Staging;trusted_connection=true")
sqlSave(ConnString,country,tablename = "Stg_Country",rownames = F )
which(is.na(country$Country_Code))