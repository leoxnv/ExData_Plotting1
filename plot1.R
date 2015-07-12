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
df$Date<- as.Date(df$Date)
df$Time<- strptime(df$Time, format ="%H:%M:%S")

#graph 1
setwd("../ExData_Plotting1")
png(filename = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col ="red", xlab ="Global Active Power(kilowatts)", main ="Global Active Power")
dev.off()