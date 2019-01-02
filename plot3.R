# read dataset
col_class_vector <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dataset <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE, colClasses = col_class_vector , na.strings = "?")
dataset$Date <- as.Date( dataset$Date   , format="%d/%m/%Y")

# subset data
dataset_period <- dataset [dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02" , ] 

# add new field for datetime
dataset_period$datetime <- paste (dataset_period$Date,dataset_period$Time)
dataset_period$datetime<-as.POSIXlt(dataset_period$datetime)

# initialize png file
png(file="plot3.png",width = 480, height = 480, units = "px")

# create plot and add lines on top
plot( x$datetime , x$Sub_metering_1 , type="n" ,xlab="datetime" , ylab= "Energy sub metering")
lines(x$datetime ,x$Sub_metering_1 ,col="black")
lines(x$datetime ,x$Sub_metering_2 ,col="red")
lines(x$datetime ,x$Sub_metering_3 ,col="blue")

# add legend
legend("topright",lty=1 , col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# turn off device
dev.off() 
