# Used the grep function in the command line to find the row numbers in which the wanted data was locate.
library(lubridate)
file <- "household_power_consumption.txt"
hc <- read.table(file, sep = ";", na.strings = "?", skip = 66637, nrows = 2880, col.names = colnames(read.table(file, nrow = 1, header = TRUE, sep = ";")), stringsAsFactor = FALSE)
hc$datetime <- dmy_hms(paste(hc$Date, hc$Time))
df <- hc[,c(10, 3:9)]
png("plot3.png", width = 480, height = 480)
plot(df[,1], df[,6], ylab = "Energy sub metering", xlab = "", type = "l")
points(df[,1], df[,7], type = "l", col = "red")
points(df[,1], df[,8], type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = 1, lty = c(1,1,1),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
