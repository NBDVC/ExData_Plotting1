

DT <- read.table("C:/Users/Greg/Desktop/household_power_consumption.txt", sep=";", header=TRUE)
View(DT)
hpq<-DT[c(1:3,7:9)]
#hpd<-as.Date(DT$Date)
hpdf<-as.Date(strptime(DT$Date,"%d/%m/%Y"))==as.Date("2007-02-01")|as.Date(strptime(DT$Date,"%d/%m/%Y"))==as.Date("2007-02-02")
hpq[7]<-paste(as.Date(strptime(hpq$Date,"%d/%m/%Y")), hpq$Time)
hpq<-hpq[hpdf,]

hpq[,3]<-as.numeric(as.character(hpq[,3]))
hpq[,4]<-as.numeric(as.character(hpq[,4]))
hpq[,5]<-as.numeric(as.character(hpq[,5]))
hpq[,6]<-as.numeric(as.character(hpq[,6]))
nas<-!is.na(hpq[4])&!is.na(hpq[5])&!is.na(hpq[6])
hpcn<-hpq[nas,]

#typeof(hpcn[,4])

png(filename="C:/Users/Greg/Desktop/plot3.png", 
    width = 480, height = 480, units= "px")

y<-hpcn[,4]
x<-strptime(hpcn$V7, "%Y-%m-%d %H:%M:%OS")


plot(x, y , type="l", ylab = "Global Active Power (kilowatts)", xlab="",col=1)
par(new=T)
y<-hpcn[,5]
plot(x, y , type="l", ylab = "", xlab="",ylim=c(0.0,40.0), axes=F, col=2)
par(new=T)
y<-hpcn[,6]
plot(x, y , type="l", ylab = "", xlab="",ylim=c(0.0,40.0),  axes=F, col=4)
legend("topright", legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"), 
       text.col=c(1,1,1), lty=1, col=c(1,2,4),  bty = "n")
par(new=F)

dev.off()