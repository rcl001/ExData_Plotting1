# Exploratory Data Analysis - Week 1 Assignment
# plot3.R
plot_file <- "plot3.png"

# R version 3.5.2 (2018-12-20) -- "Eggshell Igloo"
# Platform: x86_64-apple-darwin15.6.0 (64-bit)

# Only read data if needed; takes a while to load
if (!exists("dat")) {
    print("Reading data...")
    dat <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
}

# Examine how household energy usage varies over a 2-day period in February, 2007
# Use 2007-02-01 and 2007-02-02
dat2 <- dat[dat$Date=="1/2/2007" | dat$Date=='2/2/2007',]

# Extract date and time for plotting
dt_strings <- paste(as.character(dat2$Date), as.character(dat2$Time))
dt_POSIX <- strptime(dt_strings,"%d/%m/%Y %H:%M:%S")

# Convert Sub_metering to numeric
submet_1 <- as.numeric(as.character(dat2$Sub_metering_1))
submet_2 <- as.numeric(as.character(dat2$Sub_metering_2))
submet_3 <- as.numeric(as.character(dat2$Sub_metering_3))

# Create plot on screen
# Start with blank plot frame
plot(dt_POSIX, submet_1, type="n", xlab="", ylab="Energy sub metering")
# Add lines plot
lines(dt_POSIX, submet_1, col="black")
lines(dt_POSIX, submet_2, col="red")
lines(dt_POSIX, submet_3, col="blue")
# Add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=c(1,1,1))

# Open PNG device
png(filename = plot_file, width = 480, height = 480, units = "px")

# Regenerate plot for file
# Start with blank plot frame
plot(dt_POSIX, submet_1, type="n", xlab="", ylab="Energy sub metering")
# Add lines plot
lines(dt_POSIX, submet_1, col="black")
lines(dt_POSIX, submet_2, col="red")
lines(dt_POSIX, submet_3, col="blue")
# Add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=c(1,1,1))

# Close PNG device
dev.off()
