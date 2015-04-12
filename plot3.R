##
## Exploratory Data Analysis - Coursera
## Project 1 - plot3.R

## Read data file and include only information from 2 days,
## 2007-02-01 and 2007-02-02 from household power consumption data.
##

dataSet <- read.table("./exdata/household_power_consumption.txt", header=TRUE, sep=';', na.strings = '?')
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")

dataSubset <- dataSet[(dataSet$Date == "2007-02-01") | (dataSet$Date == "2007-02-02"),] 
dataSubset$DateTime <- strptime(paste(dataSubset$Date,dataSubset$Time),format = "%Y-%m-%d %H:%M:%S", tz = "")

## 
## Plot date/time vs Submetering columns Sub_metering 1-3
##
dataSubset$Sub_metering_1 <- as.numeric(as.character(dataSubset$Sub_metering_1))
dataSubset$Sub_metering_2 <- as.numeric(as.character(dataSubset$Sub_metering_2))
dataSubset$Sub_metering_3 <- as.numeric(as.character(dataSubset$Sub_metering_3))

png("plot3.png", width=480, height=480)
plot(dataSubset$DateTime, dataSubset$Sub_metering_1, type="n", ylab="Energy Sub metering", xlab="")
lines(dataSubset$DateTime, dataSubset$Sub_metering_1, type="l", col="black")
lines(dataSubset$DateTime, dataSubset$Sub_metering_2, type="l", col="red")
lines(dataSubset$DateTime, dataSubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1,1), col=c("black", "red", "blue"))
dev.off()

