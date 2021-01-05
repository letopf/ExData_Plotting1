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

png(file = "plot4.png", width = 480, height = 480)

# set the format
par(mfrow = c(2, 2))

# first plot
with(data_1, plot(day_time, Global_active_power, xlab = "", ylab = "Global Active Power", type = "n"))
lines(data_1$day_time, data_1$Global_active_power, type = "l")

# second plot
plot(data_1$day_time, data_1$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(data_1$day_time, data_1$Voltage, type = "l")

# third plot
plot(data_1$day_time, data_1$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(data_1$day_time, data_1$Sub_metering_1, type = "l")
lines(data_1$day_time, data_1$Sub_metering_2, col = "red", type = "l")
lines(data_1$day_time, data_1$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# fourth plot
plot(data_1$day_time, data_1$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(data_1$day_time, data_1$Global_reactive_power, type = "l")

dev.off()