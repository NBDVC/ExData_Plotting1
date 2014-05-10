

DT <- read.table("C:/Users/Greg/Desktop/household_power_consumption.txt", sep=";", header=TRUE)
View(DT)
hpq<-DT[c(1:9)]
#hpd<-as.Date(DT$Date)
hpdf<-as.Date(strptime(DT$Date,"%d/%m/%Y"))==as.Date("2007-02-01")|as.Date(strptime(DT$Date,"%d/%m/%Y"))==as.Date("2007-02-02")
hpq[10]<-paste(as.Date(strptime(hpq$Date,"%d/%m/%Y")), hpq$Time)
hpq<-hpq[hpdf,]

hpq[,3]<-as.numeric(as.character(hpq[,3]))
hpq[,4]<-as.numeric(as.character(hpq[,4]))
hpq[,5]<-as.numeric(as.character(hpq[,5]))
hpq[,6]<-as.numeric(as.character(hpq[,6]))
hpq[,7]<-as.numeric(as.character(hpq[,7]))
hpq[,8]<-as.numeric(as.character(hpq[,8]))
hpq[,9]<-as.numeric(as.character(hpq[,9]))
nas<-!is.na(hpq[4])&!is.na(hpq[5])&!is.na(hpq[6])&!is.na(hpq[7])&!is.na(hpq[8])&!is.na(hpq[9])
hpcn<-hpq[nas,]

#typeof(hpcn[,4])

png(filename="C:/Users/Greg/Desktop/plot4.png", 
    width = 480, height = 480, units= "px")

y<-hpcn[,3]
x<-strptime(hpcn$V10, "%Y-%m-%d %H:%M:%OS")

old.par <- par(mfrow=c(2, 2))
plot(x, y , type="l", ylab = "Global Active Power", xlab="")
#legend("topright", legend = c("R", "W"), text.col=c(1:2))
y<-hpcn$Voltage
plot(x, y , type="l", ylab = "Voltage", xlab="datetime")
y<-hpcn[,7]
plot(x, y , type="l", ylab = "Energy sub metering", xlab="", col=1)
par(new=T)
y<-hpcn[,8]
plot(x, y , type="l", ylab = "", xlab="",ylim=c(0.0,40.0), axes=F, col=2)
par(new=T)
y<-hpcn[,9]
plot(x, y , type="l", ylab = "", xlab="",ylim=c(0.0,40.0),  axes=F, col=4)
legend("topright", legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"), 
       text.col=c(1,1,1), lty=1, col=c(1,2,4),  bty = "n")
par(new=F)
y<-hpcn$Global_reactive_power 
plot(x, y , type="l", ylab = "Global_reactive_power", xlab="datetime")


par(old.par)

dev.off()



