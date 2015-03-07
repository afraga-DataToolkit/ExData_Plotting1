#--------------------------------
# Coursera - Exploratory Data Analysis
# Project 1 - Plot 2
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

# Prepare output graphic device
png("plot2.png", width=480, heigh=480)
# This time we need to use a generic X-Y Plotting, using lines
plot(date_ref, globalActivePwr, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()