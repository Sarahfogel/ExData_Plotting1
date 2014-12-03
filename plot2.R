# Begin by reading in the data from a file in your working directory.

    TooMuchData <- read.table(file="./household_power_consumption.txt", sep=";",
                            header = TRUE, na.strings = "?", nrows=70000)

# Subset the data and remove the large data frame for memory conservation
    TooMuchData$Date <- as.Date(TooMuchData$Date, format = "%d/%m/%Y" )
    data <- TooMuchData[which(TooMuchData$Date =="2007-02-01" 
                              | TooMuchData$Date =="2007-02-02"),]
    rm(TooMuchData)

#======================Plot 2===================================================

    png(filename="plot2.png", width=480, height=480, units = "px")
    par(bg="transparent")
    with(data, plot(Global_active_power, type="l", xaxt="n", xlab="",
                    ylab="Global Active Power (kilowatts)"), bg="transparent")
    axis(1, at=c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    dev.off()
