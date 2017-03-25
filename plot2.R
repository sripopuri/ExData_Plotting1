#set working directory
setwd("C:/Users/Sri Harish/Desktop/Coursera")

#Load package sqldf for selectively extracting data from file
library("sqldf")

o <- read.csv.sql(file="household_power_consumption.txt",sep=";",sql = "select * from file where Date in ('2/2/2007','1/2/2007')")

with(o,plot(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),Global_active_power,pch = "",type = "n",ylab = "Global Active Power (kilowatts)",xlab = ""))
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Global_active_power,pch = ".")


#create a PNG file with created plots
dev.copy(png,file="plot2.png",height = 480,width=480)
dev.off()