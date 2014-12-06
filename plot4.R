temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
data <- subset(read.table(unz(temp, "household_power_consumption.txt"), header = T, sep=";", na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")
unlink(temp)
len <- dim(data)[1]

par(mfrow = c(2, 2))

plot(data$Global_active_power, type="l", xlab="", ylab="Global Active Power", xaxt="n")
axis(side="1", seq(0, len, len/2), c("Thu", "Fri", "Sat"))

plot(data$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt="n")
axis(side="1", seq(0, len, len/2), c("Thu", "Fri", "Sat"))

plot(data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", xaxt="n")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend("topright", lty=1, bty = "n", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side="1", seq(0, len, len/2), c("Thu", "Fri", "Sat"))

plot(data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt="n")
axis(side="1", seq(0, len, len/2), c("Thu", "Fri", "Sat"))