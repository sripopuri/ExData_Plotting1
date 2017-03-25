#set working directory
setwd("C:/Users/Sri Harish/Desktop/Coursera")

#Load package sqldf for selectively extracting data from file
library("sqldf")

o <- read.csv.sql(file="household_power_consumption.txt",sep=";",sql = "select * from file where Date in ('2/2/2007','1/2/2007')")

#Constrcut a histogram
hist(o$Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)")

#create a PNG file with created plots
dev.copy(png,file="plot1.png",height = 480,width=480)

dev.off()
