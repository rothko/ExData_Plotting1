# plot2.r

# setup columns for file
columns = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
            "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# read file from dates 2007-02-01 and 2007-02-02
dat = read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", col.names=columns)

# add timestamp column to data
dat$timestamp <- with(dat, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# open png output with proper dimensions
png(file = "plot2.png", width = 480, height = 480)

# line plot of Global_active_power with no x axis label
plot(Global_active_power ~ timestamp, data=dat, type="l",  ylab="Global Active Power (kilowatts)", xlab="")

# close png output
dev.off()

