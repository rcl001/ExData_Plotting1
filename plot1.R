# Exploratory Data Analysis - Week 1 Assignment
# plot1.R
plot_file <- "plot1.png"

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

# Convert Global_active_power to numeric
y <- as.numeric(as.character(dat2$Global_active_power))

# Create histogram plot on screen
hist(y, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# Open PNG device
png(filename = plot_file, width = 480, height = 480, units = "px")

# Regenerate plot for file
hist(y, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# Close PNG device
dev.off()
