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

# plot1

# Open PNG device; create 'plot1.png' in my working directory
png(file = "./figure/plot1.png")
## Create plot and send to a file (no plot appears on screen)
hist(data$Global_active_power, xlab = "Global Active Power (killowatts)", main = "Global Active Power", col = "red")
# Close the PNG file device
dev.off()
