twitterchive - archive twitter search results
=============================================

`twittershive.sh`
-----------------

`twitterchive.sh` by [Stephen Turner](http://stephenturner.us): Script to search and save results from a Twitter search.

Script uses [sferki's `t` command line client](https://github.com/sferik/t) to search twitter for keywords stored in the arr variable inside the script.

Must first install the `t` gem and authenticate with OAuth (see the `t` readme).

Twitter enforces some API limits to how many tweets you can search for in one query, and how many queries you can execute in a given period.

I'm not sure what these limitations are, but I've hit them a few times. To be safe, I would limit the number of queries to ~5, `$n` to ~200, and run no more than a couple times per day.


Other .txt files
----------------

I'm also archiving all the search results from "#bioinformatics", "metagenomics", and "rna-seq" daily. The results from those searches are also in this repo. Each of these results is a delimited text file (unfortunately, fixed-width, not tab). I had trouble with getting CSV output (`t search -c`) to work properly - results had incomplete lines.
