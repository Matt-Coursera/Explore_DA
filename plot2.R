#Reading in the data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting to more manageable set of data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Setting up the date & time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Setting as a numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Creating the png file.
png("plot2.png", width=480, height=480)

#Plotting the results
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Clean up
dev.off()