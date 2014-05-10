

DT <- read.table("C:/Users/Greg/Desktop/household_power_consumption.txt", sep=";", header=TRUE)
View(DT)
hpq<-DT[1:3]
#hpd<-as.Date(DT$Date)
hpdf<-as.Date(strptime(DT$Date,"%d/%m/%Y"))==as.Date("2007-02-01")|as.Date(strptime(DT$Date,"%d/%m/%Y"))==as.Date("2007-02-02")
hpq[4]<-paste(as.Date(strptime(hpq$Date,"%d/%m/%Y")), hpq$Time)
hpq<-hpq[hpdf,]

hpcn<-hpq[!is.na(hpq$Global_active_power),]

#typeof(hpcn[,4])

png(filename="C:/Users/Greg/Desktop/plot2.png", 
    width = 480, height = 480, units= "px")

y<-as.numeric(as.character(hpcn[,3]))
x<-strptime(hpcn$V4, "%Y-%m-%d %H:%M:%OS")


plot(x, y , type="l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.off()