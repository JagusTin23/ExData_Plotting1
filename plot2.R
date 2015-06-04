# Used the grep function in the command line to find the row numbers in which the wanted data was locate.
library(lubridate)
file <- "household_power_consumption.txt"
hc <- read.table(file, sep = ";", na.strings = "?", skip = 66637, nrows = 2880, col.names = colnames(read.table(file, nrow = 1, header = TRUE, sep = ";")), stringsAsFactor = FALSE)
hc$datetime <- dmy_hms(paste(hc$Date, hc$Time))
df <- hc[,c(10, 3:9)]
plot(df[,1], df[,2], ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
