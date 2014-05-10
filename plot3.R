# Using data from the UC Irvine Machine Learning Repository, construct a plot
# of sub metering

# Getting the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest = "consumption.zip", method="curl")
unzip("consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Grab sub metering for the first two days in February 2007
m1 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",7])
m2 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",8])
m3 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",9])

# Write the plot as a PNG
png("plot3.png",width=480,height=480)
plot(m1,type="l",col="black",axes=FALSE,ann=FALSE)
lines(m2,type="l",col="red")
lines(m3,type="l",col="blue")
axis(2, at=seq(0,40,by=10))
axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
box()
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()
