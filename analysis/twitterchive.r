library(ggplot2)
setwd("~/code/twitterchive/analysis/")

# keywords <- c("bioinformatics", "metagenomics")
# f <- paste("../", keywords, ".txt", sep="")

trim.whitespace <- function(x) gsub("^\\s+|\\s+$", "", x)

d <- read.fwf("../bioinformatics.txt", widths=c(18, 14, 18, 1000), stringsAsFactors=FALSE, comment.char="")

d <- as.data.frame(sapply(d, trim.whitespace))
# d <- head(d, 100)
names(d) <- c("id", "datetime", "user", "text")
d$user <- sub("@", "", d$user)
d$datetime <- as.POSIXlt(d$datetime, format="%b %d %H:%M")
d$date <- as.Date(d$datetime)
d$hour <- d$datetime$hour

byDate <- as.data.frame(table(d$date))
names(byDate) <- c("date", "tweets")
ggplot(byDate) + geom_bar(aes(date, tweets), stat="identity", fill="black") + theme_bw() + ggtitle("mytitle") + theme(axis.text.x=element_text(angle=90, hjust=1))

byHour <- as.data.frame(table(d$hour))
names(byHour) <- c("hour", "tweets")
ggplot(byHour) + geom_bar(aes(hour, tweets), stat="identity", fill="black") + theme_bw() + ggtitle("mytitle") + theme(axis.text.x=element_text(angle=90, hjust=1))