#http://nsaunders.wordpress.com/2012/08/16/twitter-coverage-of-the-ismb-2012-meeting-some-statistics/
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
ggplot(byHour) + geom_bar(aes(hour, tweets), stat="identity", fill="black") + theme_bw() + ggtitle("mytitle")
with(byHour, barplot(tweets, names.arg=hour, col="black", ylab="Frequency", main="mytitle"))

words <- unlist(strsplit(d$text, " "))
head(table(words))
hashtags <- words[grep("^#", words)]
hashtags <- tolower(hashtags)
hashtags <- gsub("[^A-Za-z0-9]", "", hashtags)
hashtags <- as.data.frame(table(hashtags))
hashtags <- hashtags[sort.list(hashtags$Freq, decreasing=TRUE), ]
hashtags <- hashtags[-1, ] # remove the first row (the hashtag you're searching for?)
hashtags <- head(hashtags, 10)
hashtags$hashtags <- factor(paste(sprintf("%02d", seq(01:nrow(hashtags))), hashtags$hashtags, sep=". "))
hashtags$hashtags <- with(hashtags, factor(hashtags, levels=rev(levels(hashtags))))
ggplot(hashtags) + geom_bar(aes(hashtags, Freq), fill = "black", stat="identity") + coord_flip() + theme_bw() + ggtitle("mytitle")

## users
# users <- as.data.frame(table(ismb$screenName))
# colnames(users) <- c("user", "tweets")
# users <- users[sort.list(users$tweets, decreasing = T),]
# print(ggplot(users) + geom_point(aes(1:nrow(users), tweets), color = "salmon") + theme_bw() + opts(title = "ISMB 2012 tweets per user") + xlab("User"))

## word clouds
# sw    <- stopwords("en")
# words <- lapply(words, function(x) x[grep("^[A-Za-z0-9]+$", x)])
# words <- unlist(words)
# words <- tolower(words)
# words <- words[-grep("^[rm]t$", words)]
# words <- words[!words %in% sw]
# words.t <- as.data.frame(table(words))
# words.t <- words.t[sort.list(words.t$Freq, decreasing = T),]
# print(xtable(head(words.t, 10), caption = "Top 10 words in tweets"), include.rownames = FALSE)
# pal2 <- brewer.pal(8, "Dark2")
# wordcloud(words.t$words, words.t$Freq, scale = c(8, .2), min.freq = 3, max.words = 200, random.order = FALSE, rot.per = .15, colors = pal2)