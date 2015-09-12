# plot1.r

# setup columns for file
columns = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
            "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# read file from dates 2007-02-01 and 2007-02-02
dat = read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", col.names=columns)

# open png output with proper dimensions
png(file = "plot1.png", width = 480, height = 480)

# create histogram of desired vector from dataset
hist(dat$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# close png output
dev.off()
