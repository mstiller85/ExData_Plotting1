#loading the data and limiting the number of rows pretty arbitrarily to contain all our information with a reasonable size
raw_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?", nrows = 69516)

#filtering our dates
relevant_dates <- c("1/2/2007", "2/2/2007")
data<-raw_data[raw_data[,"Date"] == relevant_dates,]

png("plot2.png", width = 480, height = 480)

#recreating the plot // note: pretty awkward type conversion to get a date-time
plot(strptime(paste(data[,"Date"], data[,"Time"],sep=" "), format="%d/%m/%Y %H:%M:%S"), data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" ")

#close file
dev.off()