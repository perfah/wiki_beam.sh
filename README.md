# wiki_beam.sh

A tiny script that downloads any wikipedia article as a plain text file. Generated text files may at the moment contain some unwanted content (including css code). Written in bash and regex. 

### General use:

Run with:

```bash
>./wiki_beam.sh <language-code> <article-name>
```

Both the *language code* (1) and the *article name* (2) can be extracted from parts of the URL respectively: 

```
https://___1___.wikipedia.org/wiki/___2___
```

Language codes can also be found [here](https://meta.wikimedia.org/wiki/List_of_Wikipedias).

### Examples:

1.
```bash
>./wiki_beam.sh en United_States > us.txt
>cat us.txt
The United States of America (USA), commonly known as the United States...
```
2.
```bash
>./wiki_beam.sh sv Sverige
Valspråk:För Sverige i tiden[1] Nationalsång:”Du gamla, du fria...
```
