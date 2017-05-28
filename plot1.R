# plot1.R
## 1. Load data
### 1.1 Set Data file name and path
path <- "./household_power_consumption.txt"
### 1.2 Read out data
RawData <- read.table(path, header=TRUE, sep=";", na.strings = "?")
### 1.3 Define Subset of data as request
subSetData <- RawData[RawData$Date %in% c("1/2/2007","2/2/2007") ,]

## 2 First plot (Plot1)
hist(SubsetData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

## 3 Save plot as PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
