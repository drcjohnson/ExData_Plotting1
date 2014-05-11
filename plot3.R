#####
## Plot 3
##
#####

## Loading the data - assume data.file is in the working directory of R
## Only load the data with dates 1/2/2007 and 2/2/2007 - 2880 obs. of 9 variables
library(sqldf)
search <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", search)

## Combine the Date and Time columns and convert to POSIXlt type 
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")

## Plot line graph as a png file with transparent background
png("plot3.png", width = 480, height = 480, bg = "transparent")

plot(data$datetime, data$Sub_metering_1, col = "black", type = "l", main = "", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red", type = "l")
lines(data$datetime, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", cex = 0.95, lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()