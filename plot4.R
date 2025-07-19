# plot4.R

# Load and subset data
datafile <- "household_power_consumption.txt"
df <- read.table(datafile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df_sub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
df_sub$DateTime <- as.POSIXct(paste(df_sub$Date, df_sub$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot 4: 4 panels
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# Top left: Global Active Power
plot(df_sub$DateTime, df_sub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Top right: Voltage
plot(df_sub$DateTime, df_sub$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom left: Energy sub metering
plot(df_sub$DateTime, df_sub$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(df_sub$DateTime, df_sub$Sub_metering_2, col = "red")
lines(df_sub$DateTime, df_sub$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n", cex = 0.8)

# Bottom right: Global Reactive Power
plot(df_sub$DateTime, df_sub$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
