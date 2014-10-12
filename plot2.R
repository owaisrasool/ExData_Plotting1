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

hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Export to PNG

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()