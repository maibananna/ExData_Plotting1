#Read file into R
PowerCons <- read.table(file.choose(), header = TRUE, sep = ";")

#Change the Date column to R Date format
PowerCons$Date <- as.Date(PowerCons$Date, format = "%d/%m/%Y")

#Set variables for dates to subset PowerCons
Date1 <-as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")

#Subset of PowerCons
PowerCons <- PowerCons[PowerCons$Date >= Date1 & PowerCons$Date <= Date2,]

#Change Global Active Power to numeric
PowerCons$Global_active_power <- as.numeric(levels(PowerCons$Global_active_power))[PowerCons$Global_active_power]

#Extract the columns we want to graph
plot2data <- PowerCons[, c("Date", "Time", "Global_active_power")]
DateTime <- as.POSIXct(paste(as.Date(plot2data$Date,format="%d/%m/%Y"), plot2data$Time, sep=" "))

#Plot
plot(DateTime, plot2data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

#Save plot to PNG
dev.copy(png,"plot2.png")
dev.off()
