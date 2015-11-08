#loading the data and limiting the number of rows pretty arbitrarily to contain all our information with a reasonable size
raw_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?", nrows = 69516)

#filtering our dates
relevant_dates <- c("1/2/2007", "2/2/2007")
data<-raw_data[raw_data[,"Date"] == relevant_dates,]


png("plot3.png", width = 480, height = 480)

#recreating the plot // note: pretty awkward type conversion to get a date-time
x_axis<- strptime(paste(data[,"Date"], data[,"Time"],sep=" "), format="%d/%m/%Y %H:%M:%S")

#generating plot +adding 2 lines
plot(x_axis, data$Sub_metering_1, type="l", ylab="Energy sub metering",col="black", xlab=" ")
lines(x_axis,data$Sub_metering_2,col="red")
lines(x_axis,data$Sub_metering_3,col="blue")

# +legend
legend('topright', legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1),col=c("black","red","blue")) 

#close file
dev.off()
