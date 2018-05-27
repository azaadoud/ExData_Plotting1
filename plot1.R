#This script aims to plot the histogram of the Global active power

# Loading the data
data <- read.csv('household_power_consumption.txt', sep=";", 
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

# Subsetting the data 
start <- as.Date('01/02/2007', "%d/%m/%Y")
end <- as.Date('02/02/2007', "%d/%m/%Y")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >= start & data$Date <= end, ]

#plot the histogram of Global active power
hist(data$Global_active_power, col ="red", 
     xlab = "Global Active Power (kilowatts)", main= "Global Active Power")

#save the plot to a png file 
dev.copy(png, "plot1.png", width = 480, height= 480)
dev.off()
