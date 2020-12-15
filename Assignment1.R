library(dplyr)

data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

date_range <- as.Date(c("01/02/2007","02/02/2007"),format = "%d/%m/%Y")

data2day <- subset(data,as.Date(data$Date, format = "%d/%m/%Y") >= date_range[1] & as.Date(data$Date, format = "%d/%m/%Y") <= date_range[2])

data2day<-mutate(data2day,DateTime = strptime(paste(data2day$Date,data2day$Time),format = "%d/%m/%Y %H:%M:%S"))

## plot1
#screen
hist(data2day$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red")

#to file
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(data2day$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red")
dev.off()

## plot 2
plot(data2day$DateTime,data2day$Global_active_power,type = "n", xlab = "", ylab = "Global Active Power (kilowatts)",bg = "transparent")
lines(data2day$DateTime,data2day$Global_active_power,type = "l")

# to file
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data2day$DateTime,data2day$Global_active_power,type = "n", xlab = "", ylab = "Global Active Power (kilowatts)",bg = "transparent")
lines(data2day$DateTime,data2day$Global_active_power,type = "l")
dev.off()

## plot 3
plot(data2day$DateTime,data2day$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering",bg = "transparent")
lines(data2day$DateTime,data2day$Sub_metering_1,type = "l", col = "black")
lines(data2day$DateTime,data2day$Sub_metering_2,type = "l", col = "red")
lines(data2day$DateTime,data2day$Sub_metering_3,type = "l", col = "blue")
legend("topright",col = c("black","red","blue"),lty = c("solid","solid","solid"),legend = names(data2day[7:9]))

# to file
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data2day$DateTime,data2day$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering",bg = "transparent")
lines(data2day$DateTime,data2day$Sub_metering_1,type = "l", col = "black")
lines(data2day$DateTime,data2day$Sub_metering_2,type = "l", col = "red")
lines(data2day$DateTime,data2day$Sub_metering_3,type = "l", col = "blue")
legend("topright",col = c("black","red","blue"),lty = c("solid","solid","solid"),legend = names(data2day[7:9]))
dev.off()

## plot 4
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

plot(data2day$DateTime,data2day$Global_reactive_power,type = "n",xlab = "datetime",ylab = names(data2day[2]))
lines(data2day$DateTime,data2day$Global_reactive_power,type = "l")

#to file
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