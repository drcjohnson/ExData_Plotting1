#####
## Plot 4
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

## Plot composite line graphs as a png file with transparent background
png("plot4.png", width = 480, height = 480, bg = "transparent")

## Format -    Plot 1    Plot2
##             Plot3     Plot4
par(mfrow = c(2, 2))

## Plot 1
plot(data$datetime, data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power")

## Plot 2
plot(data$datetime, data$Voltage, type = "l", main = "", xlab = "datetime", ylab = "Voltage")

## Plot 3
plot(data$datetime, data$Sub_metering_1, col = "black", type = "l", main = "", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red", type = "l")
lines(data$datetime, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", cex = 0.95, bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 4
plot(data$datetime, data$Global_reactive_power, type = "l", main = "", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
