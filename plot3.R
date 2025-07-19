# plot3.R

# Load and subset data
datafile <- "household_power_consumption.txt"
df <- read.table(datafile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df_sub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
df_sub$DateTime <- as.POSIXct(paste(df_sub$Date, df_sub$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot 3: Energy sub metering
png("plot3.png", width = 480, height = 480)
plot(df_sub$DateTime, df_sub$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(df_sub$DateTime, df_sub$Sub_metering_2, col = "red")
lines(df_sub$DateTime, df_sub$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()
