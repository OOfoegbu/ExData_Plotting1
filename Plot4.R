# Script to produce a matrix of 4 plots: Global active power (kilowatts), 
# Voltage, Energy sub metering and Global reactive power as they relate to time
# using the household power consumption data between Feb. 1st and 2nd, 2007.

# All the data is read in to R
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# A subset of the relevant data is made.
Rel_Data <- subset(Data, Date %in% c("1/2/2007", "2/2/2007"))
# Creat a new column that combines the date and time columns and converts 
# them to a Date/Time class
Date_Time <- paste(Rel_Data$Date, Rel_Data$Time)
Rel_Data$Date_Time <- strptime(Date_Time, "%d/%m/%Y %H:%M:%S")

# set-up for a 2 X 2 matrix of plots, filling the rows first
par(mfrow = c(2,2))


# The plots is made using the base plotting system
# The matrix of plots is saved as a png file in the working directory with the
# desired width and height pixels.
with(Rel_Data, plot(Date_Time, Global_active_power, type = "l", xlab = '', ylab = "Global Active Power"))
with(Rel_Data, plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(Rel_Data, plot(Date_Time, Sub_metering_1, type = "n", ylab = "Energy sub metering",
                    xlab = ''))
with(Rel_Data, points(Date_Time, Sub_metering_1, type = "l", col = "black" ))
with(Rel_Data, points(Date_Time, Sub_metering_2, type = "l", col = "red" ))
with(Rel_Data, points(Date_Time, Sub_metering_3, type = "l", col = "blue" ))
legend("topright", cex = 0.5, pt.cex = 1, bty = "n", y.intersp = 0.3,
       lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1",
                                                                        "Sub_metering_2", "Sub_metering_3"))


with(Rel_Data, plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime"))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()