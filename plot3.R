#load r package sqldf

library(sqldf)

#read filtered data

data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

#convert date and times to correct classes

data$Date<-as.Date(data$Date,format="%d/%m/%Y")
datetime<-paste(as.Date(data$Date),data$Time)
data$Datetime<- as.POSIXct(datetime)

#Plot

#load r package sqldf

library(sqldf)

#read filtered data

data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)

#convert date and times to correct classes

data$Date<-as.Date(data$Date,format="%d/%m/%Y")
datetime<-paste(as.Date(data$Date),data$Time)
data$Datetime<- as.POSIXct(datetime)

#Plot

with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Export to PNG

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()