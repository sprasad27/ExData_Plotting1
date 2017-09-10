#plot4.R
#@author sprasad

# Pre-req unzipped .txt data file to be in the same folder as the script

setwd("/Users/sushmaprasad/exploratory_data_analysis/")

# Read the data
data <- read.table("household_power_consumption.txt", sep=';' , header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset the data
plot_data <- subset(data, data$Date  >= "2007-02-01" & data$Date <= "2007-02-02")
plot_data$DateTime <- paste(as.Date(plot_data$Date), plot_data$Time)
plot_data$DateTime <- as.POSIXct(plot_data$DateTime)


# Plot the graph
png("plot4.png", width=480, height=480)

# Provision to add multiple graphs
par(mfrow=c(2,2))

#First Graph
plot(x=plot_data$DateTime,y=(as.numeric( as.character(plot_data$Global_active_power))), type='l', ylab="Global Active Power",xlab="")

#Second Graph

plot(x=plot_data$DateTime, y =(as.numeric( as.character(plot_data$Voltage))), type='l', ylab="Voltage", xlab="datetime" )

#Third Graph
plot(x=plot_data$DateTime,y=(as.numeric( as.character(plot_data$Sub_metering_1))), type='l', ylab="Energy sub metering",xlab="")
lines(x=plot_data$DateTime,y=(as.numeric( as.character(plot_data$Sub_metering_2))), col="red")
lines(x=plot_data$DateTime,y=(as.numeric( as.character(plot_data$Sub_metering_3))), col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Fourth graph
plot(x=plot_data$DateTime, y =(as.numeric( as.character(plot_data$Global_reactive_power))), type='l', ylab="Global_reactive_power", xlab="datetime" )

dev.off()