png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfrow = c(2,2))

plot(data2day$DateTime,data2day$Global_active_power,type = "n", xlab = "", ylab = "Global Active Power (kilowatts)",bg = "transparent")
lines(data2day$DateTime,data2day$Global_active_power,type = "l")

plot(data2day$DateTime,data2day$Voltage,type = "n",xlab = "datetime",ylab = "Voltage")
lines(data2day$DateTime,data2day$Voltage,type = "l")

plot(data2day$DateTime,data2day$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering",bg = "transparent")
lines(data2day$DateTime,data2day$Sub_metering_1,type = "l", col = "black")
lines(data2day$DateTime,data2day$Sub_metering_2,type = "l", col = "red")
lines(data2day$DateTime,data2day$Sub_metering_3,type = "l", col = "blue")
legend("topright",col = c("black","red","blue"),lty = c("solid","solid","solid"),legend = names(data2day[7:9]))

plot(data2day$DateTime,data2day$Global_reactive_power,type = "n",xlab = "datetime",ylab = names(data2day[4]))
lines(data2day$DateTime,data2day$Global_reactive_power,type = "l")

dev.off()