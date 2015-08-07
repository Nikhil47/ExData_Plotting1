# Function to generate the plot3.png in the assignment
# See comments in the downloadCache.R file to fully understand the working of this function
# To execute run plot3(cache)

plot3 <- function(cache){
    
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