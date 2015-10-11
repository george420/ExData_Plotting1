## Getting and cleaning data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
select_date <- mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02")
select_data <- mydata[select_date, ]
select_data$Time_temp <- strptime(paste(select_data$Date, select_data$Time), format = "%Y-%m-%d %H:%M:%S")

## Making a plot and saving it to a png file with a width of 480 pixels and a height of 480 pixels
lowy <- min(select_data[, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")])
topy <- max(select_data[, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")])

png(filename = "plot3.png")

with(select_data, 
     plot(Time_temp, Sub_metering_1, col = "black", type = "l", ylim = c(low_y, high_y), xlab = "", ylab = "Energy sub metering"))

with(select_data, lines(Time_temp, Sub_metering_2, col = "red"))

with(select_data, lines(Time_temp, Sub_metering_3, col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = "_")

dev.off()