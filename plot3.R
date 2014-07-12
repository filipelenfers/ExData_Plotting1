#read data
data <- read.csv2("household_power_consumption.txt", na.strings = "?")
#select only data between "2007-02-01" and  "2007-02-02"
data <- data[as.Date(data$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]
#Merge fields Date  and Time into one
dates <- as.POSIXct(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S", tz="UTC")
#open png device
png("plot3.png", width = 480, height = 480)
#plot the graph
plot(dates,as.numeric(as.character(data$Sub_metering_1)),ylab = "Energy sub metering ", xlab=NA,type="l")
lines(dates,as.numeric(as.character(data$Sub_metering_2)), col="red")
lines(dates,as.numeric(as.character(data$Sub_metering_3)), col="blue")
legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black", "red", "blue"))
#close png device
dev.off()