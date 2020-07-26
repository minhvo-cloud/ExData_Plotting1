dat <- read.delim('household_power_consumption.txt', sep = ';') # Read data
dat$Date <- strptime(dat$Date, '%d/%m/%Y') # Convert to date

# Extract data for graphs
dat1 <- subset(dat, Date %in% c('2007-02-01', '2007-02-02')) 
dat1$Date <- as.character(dat1$Date)

datetime <- paste(dat1$Date, dat1$Time)
datetime <- strptime(datetime, '%Y-%m-%d %H:%M')
dat1$datetime <- datetime

with(dat1, plot(datetime, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = ''))
dev.copy(png, file = 'plot2.png')
dev.off()
