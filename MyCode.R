mydata<-read.csv("G3_sydney_hobart_times.csv",stringsAsFactors =FALSE)
mydata
str(mydata)
mydata$Year<-as.factor(mydata$Year)
mydata
mydata$Time<-gsub(' day','',mydata$Time)
mydata$Code.Time.less.than.3<-NULL
mydata
is.na(mydata)
mydata$Time<-gsub('<NA>','',mydata$Time)
complete.cases(mydata)
mydata<-mydata[!is.na(mydata$Time),]
library(mice)
Pre.imputation<-mice(mydata,m=5,meth="pmm",maxit = 20)
Pre.imputation$imp
mynewdata<-complete(Pre.imputation,5)
rownames(mydata)<-NULL
write.csv(mydata,file ="Myfirstdata.csv",row.names =FALSE )
library(tidyverse)
library(ggplot2)
Q<-ggplot(mydata,aes(x=fleet_start,y=fleet_finish))
Q+geom_point()
draw_hist<-ggplot(mydata,aes(fleet_start))
draw_hist+geom_histogram()
write.csv(mydata,file ="Mytask.csv",row.names =FALSE )













