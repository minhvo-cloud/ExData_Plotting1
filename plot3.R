dat <- read.delim('household_power_consumption.txt', sep = ';') # Read data
dat$Date <- strptime(dat$Date, '%d/%m/%Y') # Convert to date

# Extract data for graphs
dat1 <- subset(dat, Date %in% c('2007-02-01', '2007-02-02')) 
dat1$Date <- as.character(dat1$Date)

datetime <- paste(dat1$Date, dat1$Time)
datetime <- strptime(datetime, '%Y-%m-%d %H:%M')
dat1$datetime <- datetime

with(dat1, plot(datetime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = ''))
points(datetime, dat1$Sub_metering_2, type = 'l', col = 'red')
points(datetime, dat1$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'))
dev.copy(png, file = 'plot3.png')
dev.off()
