# ngram calculation HPC sample program

These are data-based example scripts for a HPC cluster. They are made
quickly and designed to be easy to understand (though it's not
intended that people look at the code) and show interesting problems
you might face when using a cluster.

For the most part, see the help text of the programs for how to use
them.

https://en.wikipedia.org/wiki/N-gram



## Data

Any text data will work, but this especially uses public-domain sample
data from Project Gutenberg:

- Original: https://zenodo.org/records/5783256
- Reprocessed, first 100 books: Gutenberg-Fiction-first100.zip
- Reprocessed, first 1000 books: Gutenberg-Fiction-first1000.zip

On the Stange cluster, these are available after module loading hpc-examples via the ``$HPC_EX_DATA`` variable:

```console
module load hpc-examples
ls $HPC_EX_DATA
```

A unique feature is that it can read `.txt` files from zipfiles
without needing to decompress the zipfile.

You will need to load the hpc-examples module for all the following examples:
`module load hpc-examples`

## count.py and count-multi.py

Reads in text files and outputs ngrams found within them. count-multi
is a version that uses multiprocessing with the --threads option
(though it's processes, not threads).

It can operate with characetrs (the default) or with words using
`--words`.  Word mode uses much more memory.

Example:

```console
$ python3 ${HPC_EXAMPLES}/ngrams/count.py -n 2 --stop 10 ${HPC_EX_DATA}/Gutenberg-Fiction.zip
Loaded 18738 files from ${HPC_EX_DATA}/Gutenberg-Fiction.zip
100731 ["e", " "]
88982 [" ", "t"]
82653 ["h", "e"]
82206 ["t", "h"]
```

```console
$ python3 ${HPC_EXAMPLES}/ngrams/count.py -n 2 ${HPC_EX_DATA}Gutenberg-Fiction.zip -o 2grams-all.out
Loaded 18738 files from ${HPC_EX_DATA}/Gutenberg-Fiction.zip
```


## combine-counts.py

Reads multiple count files and outputs one count file combining them.

Example:

```console
$ python3 ${HPC_EXAMPLES}/ngrams/combine-counts.py array-2grams_*.out -o 2grams-all.out
```



## generate.py

Uses a count file to generate text based on predictions using the
ngrams (for n>=2).  This doesn't work well and is extremely
inefficient, but probably everyone can understand what it's doing if
you make a analogy with how LLMs predict the next word.

Example:

```console
$ python3 ${HPC_EXAMPLES}/ngrams/generate.py 2grams-all.out
```



## Analysis

- Increasing ngram size increases the memory use.  Ngrams=1 is only
  charcter/word frequencies and thus is probably CPU and I/O bound.

- This isn't exactly CPU bound but it does use a lot of CPU.

- It works very well with array jobs and has built-in options to do that.

- Speed of reading data does matter.  Reading directly from the
  Zipfile (via Python - no extraction) gives some speedup, as long as
  you don't have to open the zipfile every time.

- The multiprocessing version isn't much faster, since it spends so
  much time moving around and accumulating the memory internally.

- The reading/writing of the count files takes a large amount of the
  time and shows the importance of good data formats.

- The MaxRSS indication in the multiprocessing version may be wrong
  (the syscall for children claims to only return MaxRSS for the child
  with the most memory usage, and may always be zero).

- (and more)
