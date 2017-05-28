# plot4.R
## 1. Load data
### 1.1 Set Data file name and path
path <- "./household_power_consumption.txt"
### 1.2 Read out data
RawData <- read.table(path, header=TRUE, sep=";", na.strings = "?")
### 1.3 Define Subset of data as request
SubsetData <- RawData[RawData$Date %in% c("1/2/2007","2/2/2007"),]
### 1.4 Convert Date and Time var. to Date/time classes
DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## 2 Fourth plot (Plot4)
par(mfrow=c(2,2))
###2.1 plot(1,1)
plot(DateTime, SubsetData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
###2.1 plot(1,2)
plot(DateTime, SubsetData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
###2.1 plot(2,1)
plot(DateTime, SubsetData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(DateTime, SubsetData$Sub_metering_2, type = "l", col = "red")
lines(DateTime, SubsetData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2,
       col=c("black", "red", "blue"), bty = "n")
###2.1 plot(2,2)
plot(DateTime, SubsetData$Global_reactive_power, type = "l",xlab = "datetime")


## 3 Save plot as PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
