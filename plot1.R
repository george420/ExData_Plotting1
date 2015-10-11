## Getting and cleaning data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
select_date <- mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02")
select_data <- mydata[select_date, ]

## Making a plot and saving it to a png file with a width of 480 pixels and a height of 480 pixels
png(filename = "plot1.png")

hist(select_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()