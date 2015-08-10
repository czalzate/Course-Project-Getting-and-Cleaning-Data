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

png(filename="plot3.png", width=480, height=480)

plot(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),vara,
type="l",xlab="",ylab="Energy sub metering")

lines(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),varb,
type="l",col="red")

lines(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),varc,
type="l",col="blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1",
"Sub_metering_2","Sub_metering_3"))

dev.off()
