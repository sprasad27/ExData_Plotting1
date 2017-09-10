#plot1.R
#@author sprasad

# Pre-req unzipped .txt data file to be in the same folder as the script

# Read the data
data <- read.table("household_power_consumption.txt", sep=';' , header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
plot_data <- subset(data, data$Date  >= "2007-02-01" & data$Date <= "2007-02-02")

# Plot the histogram
png("plot1.png", width=480, height=480)
hist((as.numeric( as.character(plot_data$Global_active_power))),main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)")
dev.off()