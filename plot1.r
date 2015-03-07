#--------------------------------
# Coursera - Exploratory Data Analysis
# Project 1 - Plot 1
# Alejandro Fraga
#--------------------------------

# Read Data
setwd("C:/Users/fragaa1/Documents/R-Scripts/Exploratory_Data_Analysis/week1/project")
archive<-"household_power_consumption.txt"
data<-read.table(archive, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetbyDates<-data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Get Global Active Power data
globalActivePwr<-as.numeric(subSetbyDates$Global_active_power)

# Prepare output graphic device
png("plot1.png", width=480, heigh=480)
hist(globalActivePwr, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()