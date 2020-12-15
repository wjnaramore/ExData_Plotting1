#include libraries
library(dplyr)

#open data, extract relevant days, add a DateTime column
unzip("exdata_data_household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
date_range <- as.Date(c("01/02/2007","02/02/2007"),format = "%d/%m/%Y")
data2day <- subset(data,as.Date(data$Date, format = "%d/%m/%Y") >= date_range[1] & as.Date(data$Date, format = "%d/%m/%Y") <= date_range[2])
data2day<-mutate(data2day,DateTime = strptime(paste(data2day$Date,data2day$Time),format = "%d/%m/%Y %H:%M:%S"))

#save figure to png file
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data2day$DateTime,data2day$Global_active_power,type = "n", xlab = "", ylab = "Global Active Power (kilowatts)",bg = "transparent")
lines(data2day$DateTime,data2day$Global_active_power,type = "l")
dev.off()