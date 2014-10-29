# Reading the data into R

# Load the "lubridate package"
library(lubridate)

# Read the full data set into R
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric", 7)))

# Obtain the subset of the dataset whose dates are 01st, 02nd Feb 2007
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Define a new column with date and time in standard format using "dmy_hms" comand
data$date_time <- paste(data$Date, data$Time, sep = " ")
data$date_time <- dmy_hms(data$date_time)

# Redefine Date column in standard format using "dmy" command
data$Date <- dmy(data$Date)
# Redefine Time column in standard format using "hms" command
data$Time <- hms(data$Time)

# plot4

# Open PNG device; create 'plot1.png' in my working directory
png(file = "./figure/plot4.png")
# Edit the margins and the no of graphs (to be 4) to be displayed in the PNG file
par(mar = c(5,4,4,4), mfrow = c(2,2))
# Graph1
with(data, plot(date_time, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))
# Graph2
with(data, plot(date_time, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))
# Graph3
with(data, plot(date_time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(data, points(date_time, Sub_metering_1, type = "l"))
with(data, points(date_time, Sub_metering_2, type = "l", col = "red"))
with(data, points(date_time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering1", "Sub_metering2", "Sub_metering3"))
#Graph4
with(data, plot(date_time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))
# Close the PNG file device
dev.off()
