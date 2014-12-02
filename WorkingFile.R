#=============Reading in Data===================================================
# Begin by reading in the data from a file in your working directory.

    data <- read.table(file="./household_power_consumption.txt", sep=";",
                       header = TRUE, na.strings = "?")
    summary(data)
    head(data)
