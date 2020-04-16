setwd("/Users/USER/Desktop/dwbi data/tb datasets")
tb2<- read.csv("mortality_by_country.csv",header = T,na.strings = c(""))
tb2$nod_exhiv<-tb2$nodexhiv
tb2$nod_exhiv<-gsub('\\[.*?\\]', '', tb2$nod_exhiv)
tb2$nod_hivnegpop<-tb2$nodhivnegpop
tb2$nod_hivnegpop<-gsub('\\[.*?\\]', '', tb2$nod_hivnegpop)
tb2$nodexhiv<-NULL
tb2$nodhivnegpop<-NULL
tb2$nod_exhiv<-as.character((tb2$nod_exhiv))
tb2$nod_exhiv<-as.integer((tb2$nod_exhiv))
tb2$nod_hivnegpop<-as.character((tb2$nod_hivnegpop))
tb2$nod_hivnegpop<-as.integer((tb2$nod_hivnegpop))
tb2$Country<-as.character((tb2$Country))


ConnString <- odbcDriverConnect("Driver=SQL Server;Server=DELL; Database=Staging;trusted_connection=true")
sqlSave(ConnString,tb2,tablename = "Stg_Mortality",rownames = F )