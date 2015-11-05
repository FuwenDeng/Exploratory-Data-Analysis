# Read the datetable
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows = 2075259)

# Convert the Date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Extract the datas of 2007-02-01 and 2007-02-02
used_data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Convert the Date and Time variable to POSIXlt
used_data$Time <- strptime(paste(used_data$Date, used_data$Time), "%Y-%m-%d %H:%M:%S")

# Create a PNG Device
png(filename = "plot3.png", width = 480, height = 480)

# Plot
plot(used_data$Time, used_data$Sub_metering_1, type = "n", main = "", xlab = "", ylab = "Energy sub metering")
points(used_data$Time, used_data$Sub_metering_1, type = "l", col = "black")
points(used_data$Time, used_data$Sub_metering_2, type = "l", col = "red")
points(used_data$Time, used_data$Sub_metering_3, type = "l", col = "blue")

# Create a legend
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

# Close PNG Device
dev.off()