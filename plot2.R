library(dplyr)
library(readr)
library(ggplot2)
fpath <- "C:/Users/sures/Documents/R/Coursera/Exploratory Data Analysis Month 4/Week 1"
setwd(fpath)
df <- read_csv2(file = file.path(fpath, "household_power_consumption.txt"), 
               n_max = 2100000,
               show_col_types = FALSE
                )

df <- subset(df, ((Date == "1/2/2007") | (Date == "2/2/2007") ))
df <- mutate(df, Date = strptime(df$Date, format = "%d/%m/%Y"))
x <- as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")
df <- mutate(df, Date_time = x)

png(file = file.path(fpath, 'plot2.png'))

par(mfrow = c(1,1))
with(df, plot(Date_time, Global_active_power, 
              "l",
              ylab = "Global Active Power (kilowatts)",
              xlab = "Day of Week")) 

dev.off()



