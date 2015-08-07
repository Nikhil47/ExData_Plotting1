# Function to generate the plot2.png in the assignment
# See comments in the downloadCache.R file to fully understand the working of this function
# To execute run plot2(cache)

plot2 <- function(cache){
    
    dat <- cache$getCache()
    if(is.null(dat)){
        dat <- cache$download()
        cache$setCache(dat)
    }
    
    png(filename = "plot2.png")
    plot(dat$Time, dat$Global_active_power, type='l', xlab = "", ylab = "Global Active Power (kilowatts)")
    dev.off()
}