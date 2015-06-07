
setwd("D:/zi386/Coursera/04_ExploratoryDataAnalysis/Assignment01")
## read ALL the data. No need to chunk data
dt  <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)
## subset data
dt  <- dt[dt$Date == "1/2/2007" | dt$Date == "2/2/2007",]
## create a posix date time column
dt$DateTime <- strptime(paste0(dt$Date, " ", dt$Time), "%d/%m/%Y %H:%M:%S")


## init device
png(filename = "plot2.png", width = 480, height = 480)
## draw graphics
plot(dt$DateTime, dt$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
## close and flush the image to disk
dev.off()

