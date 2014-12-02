#=============Reading in Data===================================================
# Begin by reading in the data from a file in your working directory.

    TooMuchData <- read.table(file="./household_power_consumption.txt", sep=";",
                       header = TRUE, na.strings = "?", nrows=70000)

# Subset the data and remove the large data frame for memory conservation
    TooMuchData$Date <- as.Date(TooMuchData$Date, format = "%d/%m/%Y" )
    data <- TooMuchData[which(TooMuchData$Date =="2007-02-01" | TooMuchData$Date =="2007-02-02"),]

###Figure out how to convert the time without adding a date onto it.
    data$Time <- strptime(data$Time, format = "%H:%M:%S")
    data$Time <- format(data$Time, format = "%H:%M:%S")

#Take a quick look at the data
    summary(data)
    head(data)
    tail(data)

#==================Plot 1=======================================================

# Create the plot using the Base Graphics Package
# Steps: Create PNG output device, create the plot, close the output device.
    png(filename="plot1.png", width=480, height=480, units = "px")
    hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
    dev.off()

#======================Plot 2===================================================
