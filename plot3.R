# Begin by reading in the data from a file in your working directory.

    TooMuchData <- read.table(file="./household_power_consumption.txt", sep=";",
                              header = TRUE, na.strings = "?", nrows=70000)

# Subset the data and remove the large data frame for memory conservation
    TooMuchData$Date <- as.Date(TooMuchData$Date, format = "%d/%m/%Y" )
    data <- TooMuchData[which(TooMuchData$Date =="2007-02-01" 
                              | TooMuchData$Date =="2007-02-02"),]
    rm(TooMuchData)

#========================Plot 3=================================================
    
# Create PNG output device, create the plot, overlay 2 other "lines" and legend
#   and close device.
    
    png(filename="plot3.png", width=480, height=480, units = "px")
    par(bg="transparent")
    plot(data$Sub_metering_1, type="l", xaxt="n", xlab="", 
         ylab="Energy sub metering", bg="transparent")
    axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    lines(data$Sub_metering_2, col="red")
    lines(data$Sub_metering_3, col="blue")
    legend(x="topright", legend=c(names(data)[7:9]), 
           col=c("black", "red", "blue"), lty=1)
    dev.off()