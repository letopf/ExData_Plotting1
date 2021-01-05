# R code for plot 2

setwd("C:/Users/jerrylin/Desktop/Data Science/Coursera 4 - Exploratory Data Analysis/Week 1")
data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?", stringsAsFactors = FALSE)
head(data)
str(data)

data_1 <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

library(lubridate)

data_1$day_time <- paste(data_1$Date, data_1$Time, sep = " ")
data_1$day_time <- strptime(data_1$day_time, format = "%d/%m/%Y %H:%M:%S")

# Change locale to English, otherwise the X axis label would be Chinese
Sys.setlocale("LC_ALL", "English")

png(file = "plot2.png", width = 480, height = 480)

plot(data_1$day_time, data_1$Global_active_power, type = "n", xlab = " ", 
     ylab = "Global Active Power (kilowatts)")
lines(data_1$day_time, data_1$Global_active_power, type = "l")

dev.off()