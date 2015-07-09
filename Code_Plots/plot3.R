# supress all warnings
options(warn=-1)

# reading specific two days data from file
fh<-file("household_power_consumption.txt","r");
data <- read.table(text = grep("^[1,2]/2/2007",readLines(fh),value=TRUE) )
data <- data.frame(data)

# splitting string into columns - copying to tmp
tmp <- matrix(unlist(strsplit(as.character(data$V1), ';')), ncol=9, byrow=TRUE)

#combining date and time 
tmp_date = strptime(paste(tmp[,1], tmp[,2]), format = "%d/%m/%Y %H:%M:%S")

#plotting to a png file
png(filename = "plot3.png",width = 480, height = 480)

plot(tmp_date,tmp[,7],type="l",main = NULL, xlab = "", ylab = "Energy sub metering")
lines(tmp_date,tmp[,8],col="red")
lines(tmp_date,tmp[,9],col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        lty = 1, col=c('black','red','blue'))

dev.off()