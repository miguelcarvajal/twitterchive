twitterchive.sh
===============

Script to search and save results from a Twitter search (with results for "#bioinformatics" and "metagenomics")

twitterchive.sh by [Stephen Turner](http://stephenturner.us)

Script uses [sferki's `t` command line client](https://github.com/sferik/t) to search twitter for keywords stored in the arr variable inside the script.

Must first install the `t` gem and authenticate with OAuth (see the `t` readme).

Twitter enforces some API limits to how many tweets you can search for in one query, and how many queries you can execute in a given period.

I'm not sure what these limitations are, but I've hit them a few times. To be safe, I would limit the number of queries to ~5, `$n` to ~200, and run no more than a couple times per day.
