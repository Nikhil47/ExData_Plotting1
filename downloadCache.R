downloadCache <- function(x){
    
    setCache <- function(y){
        x <<- y
    } 
    getCache <- function() x
    
    download <- function(){
        temp <- tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      temp, method = "curl")
        unzip(temp, "household_power_consumption.txt")
        connection <- readLines(pipe("
                                     awk '{
                                     split($0, line, \";\");
                                if(line[1] == \"1/2/2007\" || line[1] == \"2/2/2007\")
                                    print $0
                             }
                             ' household_power_consumption.txt"))
        
        classes <- c("character", "character", rep("numeric", 7))
        dat <- read.csv(tconn <- textConnection(connection), header = FALSE, sep = ";", colClasses = classes)
        names(dat) <- c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage",
                        "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        close(tconn)
        unlink(temp)
        
        dat$Date <- strptime(dat$Date, "%d/%m/%Y")
        dat$Time <- strptime(paste(dat$Date, dat$Time), "%Y-%m-%d %H:%M:%S")
        dat
    }
    
    list(setCache = setCache, getCache = getCache, download = download)
}

cache <- downloadCache(NULL)
