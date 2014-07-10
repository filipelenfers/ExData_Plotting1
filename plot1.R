#read data
data <- read.csv2("household_power_consumption.txt", na.strings = "?")
#select only data between "2007-02-01" and  "2007-02-02"
data <- data[as.Date(data$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]
#open png device
png("plot1.png", width = 480, height = 480)
#plot histogram
hist(as.numeric(as.character(data$Global_active_power)),col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close png device
dev.off()
