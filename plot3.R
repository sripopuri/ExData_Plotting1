#set working directory
setwd("C:/Users/Sri Harish/Desktop/Coursera")

#Load package sqldf for selectively extracting data from file
library("sqldf")

o <- read.csv.sql(file="household_power_consumption.txt",sep=";",sql = "select * from file where Date in ('2/2/2007','1/2/2007')")

#Constructing 3 plots with different colors
with(o,plot(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),Sub_metering_1,pch = ".",type = "n",xlab = "",ylab = "Energy sub metering"))
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Sub_metering_1,pch = ".",col = "black")
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Sub_metering_2,pch = ".",col = "red")
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Sub_metering_3,pch = ".",col = "blue")

#legend on the top left corner
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1,1),xjust = 1,yjust = 0,cex = 0.85)

#create a PNG file with created plots
dev.copy(png,file="plot3.png",height = 480,width=480)
dev.off()