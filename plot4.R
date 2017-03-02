#Read the data from data file
data <- read.table("./data/household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
#Convert Date column from string to date
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

#Extract the data on 01-Feb-2007 and 02-Feb-2007 for further analysis
studiedData <- data[data$Date == as.Date("01/02/2007", format="%d/%m/%Y") | data$Date == as.Date("02/02/2007", format="%d/%m/%Y"),]

#Convert Date Time to dateTime type
dateTime <- strptime(paste(studiedData$Date, studiedData$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

#Convert the column "Global_active_power" to numeric format
studiedData$Global_active_power<-as.numeric(studiedData$Global_active_power)

#Convert the column "Voltage" to numeric format
studiedData$Voltage<-as.numeric(studiedData$Voltage)

#Convert the column "Global_reactive_power" to numeric format
studiedData$Global_reactive_power<-as.numeric(studiedData$Global_reactive_power)

#Convert the column "Sub_metering_x" to numeric format
studiedData$Sub_metering_1<-as.numeric(studiedData$Sub_metering_1)
studiedData$Sub_metering_2<-as.numeric(studiedData$Sub_metering_2)
studiedData$Sub_metering_3<-as.numeric(studiedData$Sub_metering_3)

#Prepare to plot in PNG format
png(filename="plot4.png", width=480, height=480)
#Set the output as 2 x 2 format
par(mfrow=c(2,2))

#1st chart
plot(dateTime, studiedData$Global_active_power, xlab="", ylab="Global Active Power", type="l")

#2nd chart
plot(dateTime, studiedData$Voltage, xlab="datetime", ylab="Voltage", type="l")

#3rd chart
plot(dateTime, studiedData$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(dateTime, studiedData$Sub_metering_2, type="l", col="red")
lines(dateTime, studiedData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

#4th chart
plot(dateTime, studiedData$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()