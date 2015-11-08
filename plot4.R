#loading the data and limiting the number of rows pretty arbitrarily to contain all our information with a reasonable size
raw_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?", nrows = 69516)

#filtering our dates
relevant_dates <- c("1/2/2007", "2/2/2007")
data<-raw_data[raw_data[,"Date"] == relevant_dates,]

#generate 480x480 PNG
png("plot4.png", width = 480, height = 480)

#recreating the plot // note: pretty awkward type conversion to get a date-time
x_axis<- strptime(paste(data[,"Date"], data[,"Time"],sep=" "), format="%d/%m/%Y %H:%M:%S")

#set a 2x2 matrix for the different plots
par(mfrow = c(2, 2))

#Global Active Power Plot
plot(x_axis, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" ")

#Voltage Plot
plot(x_axis, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

#Sub metering plot
plot(x_axis, data$Sub_metering_1, type="l", ylab="Energy sub metering",col="black", xlab=" ")
lines(x_axis,data$Sub_metering_2,col="red")
lines(x_axis,data$Sub_metering_3,col="blue")
# +legend / removed the outline with bty='n' and scaled down with cex=0.75
legend('topright', legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1),bty="n",col=c("black","red","blue"),cex=0.75) 

#Global Reactive Power Plot
plot(x_axis, data$Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)", xlab="datetime")

#close file
dev.off()
