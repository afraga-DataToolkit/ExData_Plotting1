#--------------------------------
# Coursera - Exploratory Data Analysis
# Project 1 - Plot 3
# Alejandro Fraga
#--------------------------------

# Read Data
setwd("C:/Users/fragaa1/Documents/R-Scripts/Exploratory_Data_Analysis/week1/project")
archive<-"household_power_consumption.txt"
data<-read.table(archive, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetbyDates<-data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Get Global Active Power data
globalActivePwr<-as.numeric(subSetbyDates$Global_active_power)

# For this chart the X-axis need to map the date using this notation %d/%m/%Y %H:%M:%S
date_ref<-strptime(paste(subSetbyDates$Date, subSetbyDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Subset sub_meter data
meter1<- as.numeric(subSetbyDates$Sub_metering_1)
meter2<- as.numeric(subSetbyDates$Sub_metering_2)
meter3<- as.numeric(subSetbyDates$Sub_metering_3)


# Prepare output graphic device
png("plot3.png", width=480, heigh=480)
# This time we need to use a generic X-Y Plotting, using lines
plot(date_ref, meter1, type="l", xlab="", ylab="Energy Submetering")
lines(date_ref, meter2, type="l", col="red")
lines(date_ref, meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()