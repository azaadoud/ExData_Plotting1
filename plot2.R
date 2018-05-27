#This script aims to plot the the Global active power per weekday

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

#plot the Global active power per weekday
plot(y, data$Global_active_power, type = "l", 
     ylab = "Global active power (kilowatts)")

#save the plot to a png file 
dev.copy(png, "plot2.png", width = 480, height= 480)
dev.off()
