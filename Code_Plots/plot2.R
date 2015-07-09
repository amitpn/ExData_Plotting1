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
png(filename = "plot2.png",width = 480, height = 480)

plot(tmp_date,tmp[,3], type = "l", main = NULL, xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()