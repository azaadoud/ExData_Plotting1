#This script aims to plot the Energy submering per weekday

# Loading the data
data <- read.csv('household_power_consumption.txt', sep=";", 
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

# Subsetting the data 
start <- as.Date('01/02/2007', "%d/%m/%Y")
end <- as.Date('02/02/2007', "%d/%m/%Y")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= start & data$Date <= end, ]

#Merging date and time 
x <- paste(data$Date, data$Time)
y <- strptime(x, format = "%Y-%m-%d %H:%M:%S")

#plot the Energy submering per weekday
plot(y, data$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering")
points(y, data$Sub_metering_2, type = "l", col = "red")
points(y, data$Sub_metering_3, type = "l",  col = "blue")
legend("topright", lty=1,lwd=2, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save the plot to a png file 
dev.copy(png, "plot3.png", width = 480, height= 480)
dev.off()
