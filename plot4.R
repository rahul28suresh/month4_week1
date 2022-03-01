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

day <- as.POSIXct(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

df <- mutate(df, Date_time = dt)

png(file = file.path(fpath, 'plot4.png'))
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(df, {
  plot(x = day, y = Global_active_power, "l")
  plot(x = day, y = Voltage, "l", col = "blue")
  plot(x = day, y = Sub_metering_1, "l", ylab = "Energy sub metering")
  lines(x = day, y = Sub_metering_2, col = "green")
  lines(x = day, y = Sub_metering_3, col = "blue")
  legend("topright", cex = 0.5, lty = 1, col = c("black", "green", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x = day, y = Global_active_power, "l")
       
       })
dev.off()




