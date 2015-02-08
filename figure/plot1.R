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

#Load ggplot
library(ggplot2)

#Plot Histogram of Global Active Power and save to PNG
png('plot1.png')
hist(PowerCons$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
