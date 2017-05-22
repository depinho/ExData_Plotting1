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
TwoDaysData <- PowerConsumptionData[PowerConsumptionData$Date %in% StartDate:EndDate, ] #Dataset with only 
#2 Feb days

DateTime <- strptime(paste(TwoDaysData$Date, TwoDaysData$Time), "%Y-%m-%d %H:%M:%S") #Vector with date
                                                                                     # and time concatenated        
                                                                                     #for x axis of plot

png(filename = "plot3.png",width = 480, height = 480)
plot(DateTime,TwoDaysData$Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "n")    #Initialize plot with nothing in it
legend("topright", lwd= c(1,1,1), col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(DateTime,TwoDaysData$Sub_metering_1)
lines(DateTime,TwoDaysData$Sub_metering_2,col = "red")
lines(DateTime,TwoDaysData$Sub_metering_3,col = "blue")
dev.off()
 