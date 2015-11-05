# Read the datetable
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), nrows = 2075259)

# Convert the Date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Extract the datas of 2007-02-01 and 2007-02-02
used_data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Convert the Date and Time variable to POSIXlt
used_data$Time <- strptime(paste(used_data$Date, used_data$Time), "%Y-%m-%d %H:%M:%S")

# Convert the factor variable to numeric class
used_data$Global_active_power <- as.numeric(as.character(used_data$Global_active_power))

# Create a PNG Device
png(filename = "plot2.png", width = 480, height = 480)

# Plot
plot(used_data$Time, used_data$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close PNG Device
dev.off()