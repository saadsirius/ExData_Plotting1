# plot1.R

# Load and subset data
datafile <- "household_power_consumption.txt"
df <- read.table(datafile, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df_sub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plot 1: Histogram
png("plot1.png", width = 480, height = 480)
hist(df_sub$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()