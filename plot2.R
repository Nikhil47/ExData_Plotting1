plot2 <- function(){
    cache <- downloadCache()
    dat <- cache$getCache()
    if(is.null(dat)){
        dat <- cache$download()
        cache$setCache(dat)
    }
    
    png(filename = "plot2.png")
    plot(dat$Time, dat$Global_active_power, type='l', xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.off()
}