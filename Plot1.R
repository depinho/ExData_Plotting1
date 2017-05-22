fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
impfile <- "Course4_Assignment1.zip"
if(!file.exists(impfile)) 
{
    download.file(fileURL, destfile = impfile, method = "curl")
    unzip(impfile, junkpaths = TRUE) #Unzip all files, with no subdirectories, into current working directory
}

PowerConsumptionData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
PowerConsumptionData$Date <- as.Date(PowerConsumptionData$Date,"%d/%m/%Y")

StartDate <- as.Date("2007-02-01")
EndDate <- as.Date("2007-02-02")
TwoDaysData <- PowerConsumptionData[PowerConsumptionData$Date %in% StartDate:EndDate, ]
png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(TwoDaysData$Global_active_power),col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()





