library(dplyr)
library(readr)
library(ggplot2)
fpath <- "C:/Users/sures/Documents/R/Coursera/Exploratory Data Analysis Month 4/Week 1"
setwd(fpath)
df <- read.csv(file = file.path(fpath, "household_power_consumption.txt"), 
               nrows = 2100000, sep = ";"
                )

df <- subset(df, ((Date == "1/2/2007") | (Date == "2/2/2007") ))
df <- mutate(df, Date = as.Date(df$Date, format = "%d/%m/%Y"))
png(file = file.path(fpath, 'plot1.png'))
par(mfrow = c(1,1))
hist(as.numeric(df$Global_active_power), 
     col = "red", 
     breaks = 11, 
     xlim = c(0 , 6),
     xlab = "Global active power (kilowatts)",
     main = "Global active power")

dev.off()

