temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- subset(read.table(unz(temp, "household_power_consumption.txt"), header = T, sep=";", na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")
unlink(temp)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")