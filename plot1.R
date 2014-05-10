# Using data from the UC Irvine Machine Learning Repository, make a histogram
# of the global active power

# Getting the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest = "consumption.zip", method="curl")
unzip("consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Grab global active power for the first two days in February 2007
x <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",3])

# Write the plot as a PNG
png("plot1.png",width=480,height=480)
hist(x,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
