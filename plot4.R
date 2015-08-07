plot4 <- function(){
    cache <- downloadCache()
    dat <- cache$getCache()
    if(is.null(dat)){
        dat <- cache$download()
        cache$setCache(dat)
    }
    
    png(filename = "plot4.png")
    par(mfrow = c(2,2))
    
    #Plot1: Top Left Corner
    plot(dat$Time, dat$Global_active_power, type='l', xlab = "", ylab = "Global Active Power (kilowatts)")
    
    #Plot2: Top Right Corner
    plot(dat$Time, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    #Plot3: Bottom Left Corner
    plot(dat$Time, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(dat$Time, dat$Sub_metering_2, type = "l", col = "red")
    lines(dat$Time, dat$Sub_metering_3, type = "l", col = "blue")
    legend("topright", pch = "-", col = c("black", "blue", "red"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    #Plot4: Bottom Right Corner
    plot(dat$Time, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
    
    dev.off()
}