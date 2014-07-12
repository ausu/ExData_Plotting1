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


## Plot 4
png("plot4.png", width=480, height=480, bg="transparent")
par(mfcol=c(2,2))
with(dtS, {
    
    par(mar=c(4,5,1,1))
    
    plot(datetime, Global_active_power, type="l", 
         xlab="", ylab="Global Active Power")
    
    plot(datetime, Sub_metering_1, type="l",
         xlab="", ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, type="l", col="red")
    lines(datetime, Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), bty="n", box.lty=0,
          legend=names(dtS[,c(7:9)]))
    
    plot(datetime, Voltage, type="l", ylab="Voltage")    
    
    plot(datetime, Global_reactive_power, type="l", 
         ylab="Global_Reactive_Power")
    
})
dev.off()