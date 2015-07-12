library(sqldf)
setwd("~")
if (!file.exists("data")) {dir.create("data")}
setwd("./data")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip", method="curl")
unzip("data.zip")
file <- "household_power_consumption.txt"
df<- read.csv2.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
sqldf()
df$datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
df$Date<- as.Date(df$Date, format ="%d/%m/%Y")
df$Time<- strptime(df$Time, format ="%H:%M:%S")

#graph3
setwd("../ExData_Plotting1")
png(filename = "plot3.png", width = 480, height = 480)
plot(df$datetime, df$Sub_metering_1, type="l", xlab ="", ylab ="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col ="red")
lines(df$datetime, df$Sub_metering_3, col ="blue")
legend("topright",lty =1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black", "red", "blue"))
dev.off()