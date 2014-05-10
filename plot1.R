

DT <- read.table("C:/Users/gregory.clayson/Desktop/household_power_consumption.txt", sep=";", header=TRUE)
View(DT)
hpq<-as.numeric(as.character(DT$Global_active_power))
#hpd<-as.Date(DT$Date)
hpdf<-as.Date(strptime(DT$Date,"%d/%m/%Y"))==as.Date("2007-02-01")|as.Date(strptime(DT$Date,"%d/%m/%Y"))==as.Date("2007-02-02")
hpq<-hpq[hpdf]

hpcn<-hpq[!is.na(hpq)]

png(filename="C:/Users/gregory.clayson/Desktop/plot1.png", width = 480, height = 480, units = "px")



hist(hpcn, col=2, xlab="Global Active Power (kilowatts)", 
     plot=T, ylab= "Frequency", 
     main="Global Active Power"
     )

dev.off()

