#####
## Plot 2
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
png("plot2.png", width = 480, height = 480, bg = "transparent")

plot(data$datetime, data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()