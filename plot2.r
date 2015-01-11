plot2 <- function() {
  library("data.table")
  
  # read the data, but only read lines with the dates 1/2/2007 or 2/2/2007
  data <- fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings=c("?",""),sep=";")
  # get the column names, which were excluded by grep function
  names(data) = names(read.table("household_power_consumption.txt",header = TRUE, nrows = 1,sep = ";"))
  # reformat the date column
  data$Date = as.Date(strptime(data$Date,"%d/%m/%Y"))
  # add a column to the data that combines the date and time
  data = transform(data,datetime = strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"))
  # Use png graphics device to output a plot of the data
  png("plot2.png")
  with(data,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
  dev.off()
  
}