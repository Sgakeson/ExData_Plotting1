dated_household_power_consumption <- read.csv("C:/Users/windo/Desktop/R/R For Coursera/Course 4/Week 1/exdata_data_household_power_consumption/household_power_consumption.txt", header=FALSE, sep=";", skip = 66637, nrows = 2880)

plot1_data <- as.numeric(dated_household_power_consumption$V3)

png("plot1.png")

hist(plot1_data, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", xaxt = 'n', yaxt = 'n')

axis(side = 1, at = seq(0,6, by = 2))

ytick <- seq(0, 1200, 200)

axis(side = 2, at = ytick, label = ytick)

dev.off()