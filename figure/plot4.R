#Read file into R
PowerCons <- read.table(file.choose(), header = TRUE, sep = ";")

#Change the Date column to R Date format
PowerCons$Date <- as.Date(PowerCons$Date, format = "%d/%m/%Y")

#Set variables for dates to subset PowerCons
Date1 <-as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")

#Subset of PowerCons
PowerCons <- PowerCons[PowerCons$Date >= Date1 & PowerCons$Date <= Date2,]

#Change appropriate columns to numeric
PowerCons$Global_active_power <- as.numeric(levels(PowerCons$Global_active_power))[PowerCons$Global_active_power]
PowerCons$Voltage <- as.numeric(levels(PowerCons$Voltage))[PowerCons$Voltage]
Sub1 <- as.numeric(levels(PowerCons$Sub_metering_1))[PowerCons$Sub_metering_1]
Sub2 <- as.numeric(levels(PowerCons$Sub_metering_2))[PowerCons$Sub_metering_2]
Sub3 <- PowerCons[,c("Sub_metering_3")]
PowerCons$Global_reactive_power <- as.numeric(levels(PowerCons$Global_reactive_power))[PowerCons$Global_reactive_power]

#Convert date and time to POSIX
DateTime <- as.POSIXct(paste(as.Date(PowerCons$Date,format="%d/%m/%Y"), PowerCons$Time, sep=" "))

#Plot (top left, top right, bottom left, bottom right)
par(mfrow = c(2,2))
  plot(DateTime, PowerCons$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")

  plot(DateTime, PowerCons$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

  plot(DateTime, Sub1, type = "l", ylim = c(0,40), ylab = "Energy Sub Metering", xlab = " ")
    lines(DateTime,Sub2,col="red")
    lines(DateTime, Sub3, col = "blue")
    legend('topright', bty = "n",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  plot(DateTime, PowerCons$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
