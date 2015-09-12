# plot4.r

# setup columns for file
columns = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
            "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# read file from dates 2007-02-01 and 2007-02-02
dat = read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep=";", col.names=columns)

# add timestamp column to data
dat$timestamp <- with(dat, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# open png output with proper dimensions
png(file = "plot4.png", width = 480, height = 480)

# get range for first plot
range <- range(dat$Sub_metering_1) 

# line plot 
par(mfrow = c(2, 2))
with(dat, {
  plot(Global_active_power ~ timestamp, data=dat, type="l",  ylab="Global Active Power", xlab="")
  plot(Voltage ~ timestamp, data=dat, type="l", xlab="datetime")
  plot(timestamp, Sub_metering_1, type="l",  ylab="Energy sub metering", xlab="")
  par(new=T, xaxt="n", yaxt="n")
  plot(timestamp, Sub_metering_2, type="l", xlab="", ylab="", ylim=range, col="red")
  par(new=T, xaxt="n", yaxt="n")
  plot(timestamp, Sub_metering_3, type="l", xlab="", ylab="", ylim=range, col="blue")
  legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  par(xaxt="s", yaxt="s")
  plot(Global_reactive_power ~ timestamp, data=dat, type="l", xlab="datetime")
})

# close png output
dev.off()
