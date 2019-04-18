# wiki_beam.sh

A tiny script that downloads any wikipedia article as a plain text file. Generated text files may at the moment contain some unwanted content (including css code). Written in bash and regex. 

### General use:

Run with:

```
>./wiki_beam.sh <language-code> <article-name>
```

The *language code* (1) and the *article name* (2) can be extracted from two parts of the URL respectively: 

```
https://___1___.wikipedia.org/wiki/___2___
```

Language codes can also be found [here](https://meta.wikimedia.org/wiki/List_of_Wikipedias).

### Examples:

1.
```
>./wiki_beam.sh en United_States
Saved as en-United_States.txt!
```
2.
```
>./wiki_beam.sh sv Sverige
Saved as sv-Sverige.txt!
```
