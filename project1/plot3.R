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


## Plot 3
png("plot3.png", width=480, height=480, bg="transparent")
par(mfrow=c(1,1), mar=c(3,5,1,1))
plot(dtS$datetime, dtS$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(dtS$datetime, dtS$Sub_metering_2, type="l", col="red")
lines(dtS$datetime, dtS$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=names(dtS[,c(7:9)]))
dev.off()