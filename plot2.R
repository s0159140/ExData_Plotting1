## Reading in raw data
dataRaw <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                    nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
dataRaw$Date <- as.Date(dataRaw$Date, format="%d/%m/%Y")

## Subsetting dataset for a 2 day observation period
data <- subset(dataRaw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataRaw)

## Formatting dates as POSIXct class
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plotting line graph
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
