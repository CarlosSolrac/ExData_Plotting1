
setwd("D:/zi386/Coursera/04_ExploratoryDataAnalysis/Assignment01")
## read ALL the data. No need to chunk data
dt  <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE)
## subset data
dt  <- dt[dt$Date == "1/2/2007" | dt$Date == "2/2/2007",]
## create a posix date time column
dt$DateTime <- strptime(paste0(dt$Date, " ", dt$Time), "%d/%m/%Y %H:%M:%S")

## init device
png(filename = "plot3.png", width = 480, height = 480)
## draw graphics
plot(dt$DateTime, dt$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dt$DateTime, dt$Sub_metering_2, type="l", col="RED")
lines(dt$DateTime, dt$Sub_metering_3, type="l", col="BLUE")
legend("topright", legend = names(dt)[7:9], col=c("BLACK", "RED", "BLUE"), lwd = c(1,1,1))
## close and flush the image to disk
dev.off()



