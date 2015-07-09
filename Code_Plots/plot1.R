# supress all warnings
options(warn=-1)

# reading specific two days data from file
fh<-file("household_power_consumption.txt","r");
data <- read.table(text = grep("^[1,2]/2/2007",readLines(fh),value=TRUE) )
data <- data.frame(data)

# splitting string into columns - copying to tmp
tmp <- matrix(unlist(strsplit(as.character(data$V1), ';')), ncol=9, byrow=TRUE)

#plotting to a png file
png(filename = "plot1.png",width = 480, height = 480)

hist(as.numeric(tmp[,3]), col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
axis(side=2, at=seq(0, 1200, by=200))

dev.off()