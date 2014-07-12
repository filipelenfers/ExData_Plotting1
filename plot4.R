#read data
data <- read.csv2("household_power_consumption.txt", na.strings = "?")
#select only data between "2007-02-01" and  "2007-02-02"
data <- data[as.Date(data$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]
#Merge fields Date  and Time into one
datetime <- as.POSIXct(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S", tz="UTC")
#open png device
png("plot4.png", width = 480, height = 480)
#create grid for plotting 4 graphs
par(mfrow=c(2,2), cex=0.75)

#plot the graph: Date/time and Global Active power
plot(dates, as.numeric(as.character(data$Global_active_power)), ylab = "Global Active Power", xlab=NA,type="l")

#plot the graph: Date/time and Voltage
plot(datetime, as.numeric(as.character(data$Voltage)), type="l", ylab = "Voltage")

#plot the graph: Date/time and Energy sub metering
##plot sub_metering_1
plot(dates,as.numeric(as.character(data$Sub_metering_1)),ylab = "Energy sub metering ", xlab=NA,type="l")
##add sub_metering_2
lines(dates,as.numeric(as.character(data$Sub_metering_2)), col="red")
##add sub_metering_3
lines(dates,as.numeric(as.character(data$Sub_metering_3)), col="blue")
##add legend
legend("topright", lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black", "red", "blue"))

#plot the graph: Date/time and Voltage
plot(datetime, as.numeric(as.character(data$Voltage)), type="l", ylab = "Voltage")


#close png device
dev.off()
