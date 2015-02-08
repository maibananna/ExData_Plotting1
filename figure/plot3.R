#Read file into R
PowerCons <- read.table(file.choose(), header = TRUE, sep = ";")

#Change the Date column to R Date format
PowerCons$Date <- as.Date(PowerCons$Date, format = "%d/%m/%Y")

#Set variables for dates to subset PowerCons
Date1 <-as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")

#Subset of PowerCons
PowerCons <- PowerCons[PowerCons$Date >= Date1 & PowerCons$Date <= Date2,]
Sub1 <- as.numeric(levels(PowerCons$Sub_metering_1))[PowerCons$Sub_metering_1]
Sub2 <- as.numeric(levels(PowerCons$Sub_metering_2))[PowerCons$Sub_metering_2]
Sub3 <- PowerCons[,c("Sub_metering_3")]

#Convert date and time to POSIX
DateTime <- as.POSIXct(paste(as.Date(plot2data$Date,format="%d/%m/%Y"), plot2data$Time, sep=" "))

#Plot and save to PNG
png('plot3.png')
plot(DateTime, Sub1, type = "l", ylim = c(0,40), ylab = "Energy Sub Metering")
lines(DateTime,Sub2,col="red")
lines(DateTime, Sub3, col = "blue")
legend('topright', lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
