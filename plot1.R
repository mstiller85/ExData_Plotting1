#loading the data and limiting the number of rows pretty arbitrarily to contain all our information with a reasonable size
raw_data <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?", nrows = 69516)

#filtering our dates
relevant_dates <- c("1/2/2007", "2/2/2007")
data<-raw_data[raw_data[,"Date"] == relevant_dates,]

#generate 480x480 PNG
png("plot1.png", width = 480, height = 480)

#recreating the histogram
hist(data$Global_active_power,main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)", xlim=c(0,6))

#close PNG
dev.off()

