# twitterchive - Archive Twitter search results

Blog post about what's in here coming soon on <http://gettinggeneticsdone.blogspot.com>.

## `twittershive.sh`

[`twitterchive.sh`](twitterchive.sh): Script to search and save results from a Twitter search.

Script uses [sferki's `t` command line client](https://github.com/sferik/t) to search twitter for keywords stored in the arr variable inside the script.

Must first install the `t` gem and authenticate with OAuth (see the `t` readme).

Twitter enforces some API limits to how many tweets you can search for in one query, and how many queries you can execute in a given period.

I'm not sure what these limitations are, but I've hit them a few times. To be safe, I would limit the number of queries to ~5, `$n` to ~200, and run no more than a couple times per hour.

## Other .txt files

I'm archiving all the search results from [bioinformatics](bioinformatics.txt), [metagenomics](metagenomics.txt), [rna-seq](rna-seq.txt), and [#rstats](rstats.txt) daily. I also archived all the tweets around the Biology of Genomes 2013 meeting ([#bog13](bog13.txt)). The results from those searches are also in this repo. Each of these results is a delimited text file (unfortunately, fixed-width, not tab - I had trouble with getting CSV output with `t search -c` to work properly, results having incomplete lines).

## `analysis/twitterchive.r`

[`analysis/twitterchive.r`](analysis/twitterchive.r): R stats script that contains a function to read in and parse the fixed width text files above, and produce some plots:

* Number of tweets per day for the last *n* days
* Frequency of tweets by hour of the day
* Barplot of the most frequently used hashtags within a query
* Barplot of the most prolific tweeters
* The ubiquitous wordcloud