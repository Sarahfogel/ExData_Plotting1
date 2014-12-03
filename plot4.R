# Begin by reading in the data from a file in your working directory.

    TooMuchData <- read.table(file="./household_power_consumption.txt", sep=";",
                              header = TRUE, na.strings = "?", nrows=70000)

# Subset the data and remove the large data frame for memory conservation
    TooMuchData$Date <- as.Date(TooMuchData$Date, format = "%d/%m/%Y" )
    data <- TooMuchData[which(TooMuchData$Date =="2007-02-01" 
                              | TooMuchData$Date =="2007-02-02"),]
    rm(TooMuchData)

#=========================Plot 4================================================
    
    
    orig.par<-par()
    
    png(filename="plot4.png", width=480, height=480, units = "px")
    par(mfcol=c(2,2), bg="transparent")
    
# Plot 2 repeated with ylab changed
    with(data, plot(Global_active_power, type="l", xaxt="n", xlab="",
                    ylab="Global Active Power"), bg="transparent")
    axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
# Plot 3 repeated but no box around legend
    plot(data$Sub_metering_1, type="l", xaxt="n", xlab="", 
         ylab="Energy sub metering", bg="transparent")
    axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    lines(data$Sub_metering_2, col="red")
    lines(data$Sub_metering_3, col="blue")
    legend(x="topright", legend=c(names(data)[7:9]), bty='n', 
           col=c("black", "red", "blue"), lty=1)
    
# New plot 1
    with(data, plot(Voltage, type="l", xlab="datetime", xaxt="n"))
    axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
# New plot 2
    with(data, plot(Global_reactive_power, type="l", xlab="datetime",
                    xaxt="n"))
    axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
    
    dev.off()
    par(orig.par)
    