##Importing Data and Cleaning

dated_household_power_consumption <- read.csv("C:/Users/windo/Desktop/R/R For Coursera/Course 4/Week 1/exdata_data_household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";", skip = 66637, nrows = 2880)

dated_household_power_consumption$V1 <- as.Date(dated_household_power_consumption$V1, format = "%d/%m/%Y")

colnames(dated_household_power_consumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global Intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

x <- dated_household_power_consumption$Date
y <- dated_household_power_consumption$Time

dated_household_power_consumption <- subset(dated_household_power_consumption, select = -(Time))

xy <- paste(x,y)

xy <- strptime(xy, format = "%d/%m/%Y %H:%M:%S")

dated_household_power_consumption$Date <- xy
Index <- seq(1, 2880, 1)
dated_household_power_consumption <- cbind(dated_household_power_consumption, Index)

##Creating Plot 3

png("plot3.png", width = 480, height = 480)
par(pty = "s")
plot(Index, dated_household_power_consumption$Sub_metering_1, xaxt = "n", yaxt = "n", type = "l", xlab = "", ylab = "Energy sub metering")
lines(dated_household_power_consumption$Sub_metering_2, col = "red")
lines(dated_household_power_consumption$Sub_metering_3, col = "blue")
axis(side = 2, at = seq(0, 30, by = 10))
axis(side = 1, at = seq(0, 2880, by = 1440), label = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = .5)
dev.off()
