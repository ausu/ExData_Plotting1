## Reading in data
classes <- c("character", "character", "numeric", "numeric", "numeric", 
             "numeric", "numeric", "numeric", "numeric")
dt <- read.table("household_power_consumption.txt", header=TRUE,
                 sep=";", na.string="?", colClasses=classes)
str(dt)

# Data from the dates 2007-02-01 and 2007-02-02
dtS <- subset(dt, dt$Date=="1/2/2007"|dt$Date=="2/2/2007"); nrow(dtS)

# Convert Date and Time variables
x <- paste(dtS$Date, dtS$Time)
dtS$datetime <- strptime(x, "%d/%m/%Y %H:%M:%S")


## Plot 1
png("plot1.png", width=480, height=480, bg="transparent")
par(mfrow=c(1,1))
hist(dtS$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()