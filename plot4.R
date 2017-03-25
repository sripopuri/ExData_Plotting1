#set working directory
setwd("C:/Users/Sri Harish/Desktop/Coursera")

#Load package sqldf for selectively extracting data from file
library("sqldf")

o <- read.csv.sql(file="household_power_consumption.txt",sep=";",sql = "select * from file where Date in ('2/2/2007','1/2/2007')")

#Using par function to plot 4 plots
par(mfrow = c(2,2))
with(o,plot(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),Global_active_power,pch = "",type = "n",ylab = "Global Active Power (kilowatts)",xlab = ""))
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Global_active_power,pch = ".")
with(o,plot(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),Voltage,pch = "",type = "n",xlab = "datetime"))
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Voltage,pch = ".")
with(o,plot(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),Sub_metering_1,pch = ".",type = "n",xlab = "",ylab = "Energy sub metering"))
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Sub_metering_1,pch = ".",col = "black")
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Sub_metering_2,pch = ".",col = "red")
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Sub_metering_3,pch = ".",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1,1),cex = .25,inset = 0.015,box.col = "white",text.font = 4)
with(o,plot(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),Global_reactive_power,pch = "",type = "n",ylab = "Global_reactive_power ",xlab = "datetime"))
lines(as.POSIXct(paste(o$Date, o$Time), format="%d/%m/%Y %H:%M:%S"),o$Global_reactive_power,pch = ".")

#create a PNG file with created plots
dev.copy(png,file="plot4.png",height = 480,width=480)
dev.off()