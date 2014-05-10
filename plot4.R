# Using data from the UC Irvine Machine Learning Repository, construct
# various plots

# Getting the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest = "consumption.zip", method="curl")
unzip("consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

# Write the plot as a PNG
png("plot4.png",width=480,height=480)

#create 4 plots
par(mfrow=c(2,2),mar=c(4.5,4,4.5,4))

#plot 1
# Grab global active power for the first two days in February 2007
x <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",3])
plot(x,type="l",axes=FALSE,ylab="Global Active Power",xlab="")
axis(2, at=seq(0,8,by=2))
axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
box()

#plot 2
# Grab voltage for the first two days in February 2007
x <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",5])
plot(x,type="l",axes=FALSE,ylab="Voltage",xlab="")
axis(2)
axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
box()
title(xlab = "datetime")

#plot 3
# Grab sub metering for the first two days in February 2007
m1 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",7])
m2 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",8])
m3 <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",9])

#plot the data
plot(m1,type="l",col="black",axes=FALSE,ann=FALSE)
lines(m2,type="l",col="red")
lines(m3,type="l",col="blue")
axis(2, at=seq(0,40,by=10))
title(ylab="Energy sub metering")
axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
box()
legend("topright",cex=.84,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")

#plot 4
# Grab global reactive power for the first two days in February 2007
x <- as.numeric(data[data$Date == "1/2/2007"|data$Date == "2/2/2007",4])
plot(x,type="l",axes=FALSE,ylab="Global_reactive_power",xlab="")
axis(2)
axis(1, at=seq(0,2880,1440),labels=c("Thurs","Fri","Sat"))
box()
title(xlab = "datetime")

dev.off()