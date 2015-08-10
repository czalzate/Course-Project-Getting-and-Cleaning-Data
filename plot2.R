


data<-read.csv("household.txt",skip=66637,nrows=2880,header=F,sep=";",
stringsAsFactors=F,na.strings="?",
colClasses=c("character","character","numeric","numeric","numeric","numeric",
"numeric","numeric","numeric"))

head(data,n=100)

names(data)<-names(read.csv("household.txt",nrows=1,sep=";"))

varx<-as.numeric(data$Global_active_power)

png(filename="plot2.png", width=480, height=480)
plot(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"),varx,
type="l",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.off()







