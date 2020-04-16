setwd("/Users/USER/Desktop/dwbi data/tb datasets")
tb<- read.csv("incidence.csv",header = T,na.strings = c(""))
tb$tbcases<-tb$tb_cases
tb$tbcases<-gsub('\\[.*?\\]', '', tb$tbcases)
tb$tbper_pop<-tb$tbperpop
tb$tbper_pop<-gsub('\\[.*?\\]', '', tb$tbper_pop)
tb$tbcases_hiv<-tb$tb_cases_hiv
tb$tbcases_hiv<-gsub('\\[.*?\\]', '', tb$tbcases_hiv)
tb$tbper_pophiv<-tb$tbperpop_hiv
tb$tbper_pophiv<-gsub('\\[.*?\\]', '', tb$tbper_pophiv)
tb$tb_cases<-NULL
tb$tbperpop<-NULL
tb$tb_cases_hiv<-NULL
tb$tbperpop_hiv<-NULL
tb$tbper_pophiv<-as.character((tb$tbper_pophiv))
tb$tbper_pophiv<-as.numeric((tb$tbper_pophiv))
tb$tbper_pophiv[is.na(tb$tbper_pophiv)]<-0
tb$tbcases_hiv<-as.character((tb$tbcases_hiv))
tb$tbcases_hiv<-as.integer((tb$tbcases_hiv))
tb$tbcases_hiv[is.na(tb$tbcases_hiv)]<-0
tb$tbper_pop<-as.integer((tb$tbper_pop))
tb$Country<-as.character((tb$Country))
tb$Year<-as.integer((tb$Year))
tb$tbcases<-as.integer((tb$tbcases))
tb$tbcases_hiv<-as.integer((tb$tbcases_hiv))

install.packages("RODBC")
library(RODBC)
ConnString <- odbcDriverConnect("Driver=SQL Server;Server=DELL; Database=Staging;trusted_connection=true")
sqlSave(ConnString,tb,tablename = "Stg_Incidence",rownames = F )


