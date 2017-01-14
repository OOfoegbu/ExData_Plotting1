# Script to produce a histogram of Global active power (kilowatts)
# using the household power consumption data between Feb. 1st and 2nd, 2007.

# All the data is read in to R
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# A subset of the relevant data is made. 
Rel_Data <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
# The data and time columns are converted from factor class to Date and POSIXIt class
Rel_Data$Date <- as.Date(Rel_Data$Date, "%d/%m/%Y")
Rel_Data$Time <- strptime(Rel_Data$Time, "%H:%M:%S")

# The histogram is made using the base plotting system
# The histogram is saved as a png file in the working directory with the
# desired width and height pixels.
hist(Rel_Data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()