# R code for plot 3

setwd("C:/Users/jerrylin/Desktop/Data Science/Coursera 4 - Exploratory Data Analysis/Week 1")
data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?", stringsAsFactors = FALSE)
head(data)
str(data)

data_1 <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

library(lubridate)

data_1$day_time <- paste(data_1$Date, data_1$Time, sep = " ")
data_1$day_time <- strptime(data_1$day_time, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)

plot(data_1$day_time, data_1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data_1$day_time, data_1$Sub_metering_1, type = "l")
lines(data_1$day_time, data_1$Sub_metering_2, col = "red", type = "l")
lines(data_1$day_time, data_1$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

dev.off()