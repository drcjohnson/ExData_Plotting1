#####
## Plot 1
##
#####

## Load the data - assume data.file is in the working directory of R
## Only load the data with dates 1/2/2007 and 2/2/2007 - 2880 obs. of 9 variables
library(sqldf)
search <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
data <- read.csv2.sql("household_power_consumption.txt", search)

## Plot histogram as a png file with transparent background
png("plot1.png", width = 480, height = 480, bg = "transparent")

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()