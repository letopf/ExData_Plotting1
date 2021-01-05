# R code for plot 1

setwd("C:/Users/jerrylin/Desktop/Data Science/Coursera 4 - Exploratory Data Analysis/Week 1")
data <- read.table("./household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?", stringsAsFactors = FALSE)
head(data)
str(data)

data_1 <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

png(file = "plot1.png", width = 480, height = 480)

hist(data_1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()