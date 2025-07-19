# plot2.R

# Load and subset data
datafile <- "household_power_consumption.txt"
df <- read.table(datafile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df_sub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
df_sub$DateTime <- as.POSIXct(paste(df_sub$Date, df_sub$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot 2: Line plot
png("plot2.png", width = 480, height = 480)
plot(df_sub$DateTime, df_sub$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
