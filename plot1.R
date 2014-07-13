# Download file
# URL of datafile
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, "household.zip")

# Decompress household.zip

# Read and decompress
datos <- read.table(unz("household.zip", "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = TRUE)

#x <- readLines("household_power_consumption.txt",10)
#x

# data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
dim(datos)
str(datos)

datos$Date <- as.character(datos$Date)
datos$Time  <- as.character(datos$Time)

# Subsetting 2007-02-01 and 2007-02-02.
data <- datos[datos$Date == "1/2/2007" | datos$Date == "2/2/2007",]

hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "plot1.png")
dev.off()

