##
## Exploratory Data Analysis - Coursera
##

## Read data file and include only information from 2 days,
## 2007-02-01 and 2007-02-02 from household power consumption data.
##

dataSet <- read.table("./exdata/household_power_consumption.txt", header=TRUE, sep=';', na.strings = '?')
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")

dataSubset <- dataSet[(dataSet$Date == "2007-02-01") | (dataSet$Date == "2007-02-02"),] 
dataSubset$DateTime <- strptime(paste(dataSubset$Date,dataSubset$Time),format = "%Y-%m-%d %H:%M:%S", tz = "")

dataSubset$Global_active_power <- as.numeric(as.character(dataSubset$Global_active_power))

##
## Plot 3 histogram of Global Active Power

png(filename = "plot1.png", width = 480, height = 480)
hist(dataSubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


