#Read the data from data file
data <- read.table("./data/household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
#Convert Date column from string to date
data$Date<-as.Date(data$Date, format="%d/%m/%Y")

#Extract the data on 01-Feb-2007 and 02-Feb-2007 for further analysis
studiedData <- data[data$Date == as.Date("01/02/2007", format="%d/%m/%Y") | data$Date == as.Date("02/02/2007", format="%d/%m/%Y"),]

#Convert the column "Global_active_power" to numeric format
studiedData$Global_active_power<-as.numeric(studiedData$Global_active_power)

#Prepare to plot in PNG format
png(filename="plot1.png", width=480, height=480)

#Generate the Histogram with the color as "Red", Title as "Global Active Power", X-Axis Label as "Global Active Power (kilowatts".
hist(studiedData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()