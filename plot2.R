temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- subset(read.table(unz(temp, "household_power_consumption.txt"), header = T, sep=";", na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")
unlink(temp)

plot(data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")

len <- dim(data)[1]
axis(side="1", seq(0, len, len/2), c("Thu", "Fri", "Sat"))