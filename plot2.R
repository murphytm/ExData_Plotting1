plot2 <- function( ) {

# R x64 3.1.0:
#    > getwd()
#    File  >  Change dir...
# source("plot2.R")


# The UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/) is a popular repository for machine learning datasets.
# Using the "Individual household electric power consumption Data Set", four plots are produced.
#
# Dataset: Electric power consumption [20 MB].
#
# Description: Measurements of electric power consumption in one household with a one-minute sampling rate
# over a period of almost 4 years.  Different electrical quantities and some sub-metering values are available.
#
# Variables -
#    Date: date in format dd/mm/yyyy
#    Time: time in format hh:mm:ss
#    Global_active_power: household global minute-averaged active power (in kilowatts)
#    Global_reactive_power: household global minute-averaged reactive power (in kilowatts)
#    Voltage: minute-averaged voltage (in volts)
#    Global_intensity: household global minute-averaged current intensity (in amperes)
#    Sub_metering_1: energy sub-metering No. 1 (in watt-hours of active energy) [corresponds to the kitchen]
#    Sub_metering_2: energy sub-metering No. 2 (in watt-hours of active energy) [corresponds to the laundry room]
#    Sub_metering_3: energy sub-metering No. 3 (in watt-hours of active energy) [corresponds to an electric water-heater and an air-conditioner].
#
# The dataset has 2,075,259 rows.
#
# Missing values are coded as "?" in this dataset.
#
# The plots include only data from the dates 2007-02-01 and 2007-02-02.
#
# Overall goal: simply examine how household energy usage varies over a 2-day period in February, 2007.
#
# Each plot is constructed using the base plotting system and save to a PNG file (width = 480 pixels, height = 480 pixels).


######## course project ########


df1 = read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", na.strings = "?")
# print(class(df1))
# print(names(df1))
print(dim(df1))

df1 <- subset(df1, !(is.na(Date) | is.na(Time)))

df1$DateTime <- strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")   # create new "POSIXlt" column
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")   # re-caste existing column as "Date"
# print(str(df1))

startDate <- as.Date("2007-02-01", "%Y-%m-%d")
endDate   <- as.Date("2007-02-02", "%Y-%m-%d")
df2 <- subset(df1, !((Date < startDate) | (Date > endDate)))
# print(head(df2))
# print(tail(df2))
print(dim(df2))


#### plot 2 ####


plot(df2$DateTime, as.numeric(df2$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", type='l')

dev.copy(png, file = "plot2.png")   # 480 x 480
dev.off()

}
