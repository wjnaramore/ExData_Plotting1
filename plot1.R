png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(data2day$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red")
dev.off()