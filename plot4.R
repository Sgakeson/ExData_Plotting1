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
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
##Plot 1
par(pty = "s")
plot(Index, dated_household_power_consumption$Global_active_power, xaxt = "n", yaxt = "n", type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
axis(side = 2, at = seq(0, 6, by = 2))
axis(side = 1, at = seq(0, 2880, by = 1440), label = c("Thu", "Fri", "Sat"))

##Plot 2
par(pty = "s")
plot(Index, dated_household_power_consumption$Voltage, xaxt = "n", yaxt = "n", type = "l", ylab = "Voltage", xlab = "datetime")
axis(side = 2, at = seq(234, 246, by = 4))
axis(side = 1, at = seq(0, 2880, by = 1440), label = c("Thu", "Fri", "Sat"))

##Plot 3
par(pty = "s")
plot(Index, dated_household_power_consumption$Sub_metering_1, xaxt = "n", yaxt = "n", type = "l", xlab = "", ylab = "Energy sub metering")
lines(dated_household_power_consumption$Sub_metering_2, col = "red")
lines(dated_household_power_consumption$Sub_metering_3, col = "blue")
axis(side = 2, at = seq(0, 30, by = 10))
axis(side = 1, at = seq(0, 2880, by = 1440), label = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = .05)

##Plot 4
par(pty = "s")
plot(Index, dated_household_power_consumption$Global_reactive_power, xaxt = "n", yaxt = "n", type = "l", ylab = "Global_reactive_power", xlab = "datetime")
axis(side = 2, at = seq(0, 0.5, by = 0.1))
axis(side = 1, at = seq(0, 2880, by = 1440), label = c("Thu", "Fri", "Sat"))
dev.off()