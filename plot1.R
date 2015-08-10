        # Power consumption class project
#Getting the data
names <- read.table("./data/household_power_consumption.txt", header = TRUE,sep = ";", nrows = 1)  # gettin' only the header row
hdr <- names(names) # tucking away the header info to grab and insert into table later
powr <-read.table("household_power_consumption.txt",  sep = ";",col.names = hdr, skip = 66637,na.strings = "?", nrows = 2880)


#Seeting up date and time
powr$Date <- as.Date(powr$Date, "%d/%m/%y")  #changing date column data to date format DD/MM/YYYY
powr$Time <- strptime(powr$Time,  "%H:%M:%S") #changing time column data to time format HH:MM:SS

#PLotting the results
a <- powr$Global_active_power
hist(a, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#Creating the png file
dev.copy(png, file="plot1.png", height=480, width=480)

#Cleaning up
dev.off()
