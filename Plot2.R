# Script to produce a line plot of Global active power (kilowatts) as it relates to time
# using the household power consumption data between Feb. 1st and 2nd, 2007.

# All the data is read in to R
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# A subset of the relevant data is made. 
Rel_Data <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
# Creat a new column that combines the date and time columns and converts 
# them to a Date/Time class
Date_Time <- paste(Rel_Data$Date, Rel_Data$Time)
Rel_Data$Date_Time <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")


# The plot is made using the base plotting system
# The plot is saved as a png file in the working directory with the
# desired width and height pixels.
with(Rel_Data, plot(Date_Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",
                    xlab = ''))
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
