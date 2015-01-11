plot1 <- function() {
  library("data.table")
  
  # read the data, but only read lines with the dates 1/2/2007 or 2/2/2007
  data <- fread("grep ^[12]/2/2007 household_power_consumption.txt",na.strings=c("?",""),sep=";")
  # get the column names, which were excluded by grep function
  names(data) = names(read.table("household_power_consumption.txt",header = TRUE, nrows = 1,sep = ";"))
  
  # reformat the date column
  data$Date = as.Date(strptime(data$Date,"%d/%m/%Y"))
  
  # Use png graphics device to output a plot of the data
  png("plot1.png")
  hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.off()
  
}