png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data2day$DateTime,data2day$Global_active_power,type = "n", xlab = "", ylab = "Global Active Power (kilowatts)",bg = "transparent")
lines(data2day$DateTime,data2day$Global_active_power,type = "l")
dev.off()