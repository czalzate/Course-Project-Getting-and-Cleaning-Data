


data<-read.csv("household.txt",skip=66637,nrows=2880,header=F,sep=";",
stringsAsFactors=F,na.strings="?",
colClasses=c("character","character","numeric","numeric","numeric","numeric",
"numeric","numeric","numeric"))

head(data,n=100)

names(data)<-names(read.csv("household.txt",nrows=1,sep=";"))

varx<-as.numeric(data$Global_active_power)
vara<-as.numeric(data$Sub_metering_1)
varb<-as.numeric(data$Sub_metering_2)
varc<-as.numeric(data$Sub_metering_3)
vard<-as.numeric(data$Voltage)
vare<-as.numeric(data$Global_reactive_power)

png(filename="plot4.png", width=480, height=480)


par(mfcol = c(2,2))

#First graph
plot(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),varx,
type="l",xlab = "",ylab = "Global Active Power(kilowatts)")

#Second graph
plot(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),vara,
type="l",xlab="",ylab="Energy sub metering")

lines(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),varb,
type="l",col="red")

lines(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),varc,
type="l",col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1",
"Sub_metering_2","Sub_metering_3"))

#Third graph
plot(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),vard,
type="l",xlab="datetime",ylab="Voltage")

#Fourth graph
plot(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),vare,
type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()