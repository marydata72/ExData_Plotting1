
## Exploratory Data Analysis - Coursera
## Project 1 - plot4.R

## Read data file and include only information from 2 days,
## 2007-02-01 and 2007-02-02 from household power consumption data.
##

dataSet <- read.table("./exdata/household_power_consumption.txt", header=TRUE, sep=';', na.strings = '?')
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")

dataSubset <- dataSet[(dataSet$Date == "2007-02-01") | (dataSet$Date == "2007-02-02"),] 
dataSubset$DateTime <- strptime(paste(dataSubset$Date,dataSubset$Time),format = "%Y-%m-%d %H:%M:%S", tz = "")

## Combine 4 plots 
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

##
## Plot - upper left Global Active Power

dataSubset$Global_active_power <- as.numeric(as.character(dataSubset$Global_active_power))
plot(dataSubset$DateTime, dataSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##
## Plot  - upper right - Voltage

dataSubset$Voltage <- as.numeric(as.character(dataSubset$Voltage))
plot(dataSubset$DateTime, dataSubset$Voltage, type="l", xlab="DateTime", ylab="Voltage")

##
## Plot - lower left - Energy Submetering

dataSubset$Sub_metering_1 <- as.numeric(as.character(dataSubset$Sub_metering_1))
dataSubset$Sub_metering_2 <- as.numeric(as.character(dataSubset$Sub_metering_2))
dataSubset$Sub_metering_3 <- as.numeric(as.character(dataSubset$Sub_metering_3))

plot(dataSubset$DateTime, dataSubset$Sub_metering_1, type="n", ylab="Energy Sub metering", xlab="")
lines(dataSubset$DateTime, dataSubset$Sub_metering_1, type="l", col="black")
lines(dataSubset$DateTime, dataSubset$Sub_metering_2, type="l", col="red")
lines(dataSubset$DateTime, dataSubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1,1), col=c("black", "red", "blue"))

##
## Plot - lower right - Global Reactive Power

dataSubset$Global_reactive_power <- as.numeric(as.character(dataSubset$Global_reactive_power))
plot(dataSubset$DateTime, dataSubset$Global_reactive_power, type="l", xlab="DateTime", ylab="Global Reactive Power")
dev.off()

