#plot2.R
#@author sprasad

# Pre-req unzipped .txt data file to be in the same folder as the script

# Read the data
data <- read.table("household_power_consumption.txt", sep=';' , header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset the data
plot_data <- subset(data, data$Date  >= "2007-02-01" & data$Date <= "2007-02-02")
plot_data$DateTime <- paste(as.Date(plot_data$Date), plot_data$Time)
plot_data$DateTime <- as.POSIXct(plot_data$DateTime)

# Plot the graph
png("plot2.png", width=480, height=480)
plot(x=plot_data$DateTime,y=(as.numeric( as.character(plot_data$Global_active_power))), type='l', ylab="Global Active Power (kilowatts)",xlab="")
dev.off()