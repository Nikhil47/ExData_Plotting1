plot1 <- function(){
    cache <- downloadCache()
    dat <- cache$getCache()
    if(is.null(dat)){
        dat <- cache$download()
        cache$setCache(dat)
    }
    
    png(filename = "plot1.png")
    hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (KiloWatts)",
         main = "Global Active Power")
    dev.off()
}