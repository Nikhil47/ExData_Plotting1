plot3 <- function(){
    cache <- downloadCache()
    dat <- cache$getCache()
    if(is.null(dat)){
        dat <- cache$download()
        cache$setCache(dat)
    }
    
    png(filename = "plot3.png")
    plot(dat$Time, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(dat$Time, dat$Sub_metering_2, type = "l", col = "red")
    lines(dat$Time, dat$Sub_metering_3, type = "l", col = "blue")
    legend("topright", pch = "-", col = c("black", "blue", "red"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}