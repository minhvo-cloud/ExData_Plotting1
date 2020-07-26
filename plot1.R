dat <- read.delim('household_power_consumption.txt', sep = ';') # Read data
dat$Date <- strptime(dat$Date, '%d/%m/%Y') # Convert to date

# Extract data for graphs
dat1 <- subset(dat, Date %in% c('2007-02-01', '2007-02-02')) 
dat1$Global_active_power <- as.numeric(dat1$Global_active_power)
hist(dat1$Global_active_power , col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.copy(png, file = 'plot1.png')
dev.off()
