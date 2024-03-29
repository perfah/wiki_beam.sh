# wiki_beam.sh

A tiny script that retrieves the content of any Wikipedia-article and outputs it to stdout. Generated text files may contain some unwanted content such as css-code in some cases. Written in bash and regex. A separate script called ```autobeam.sh``` is also provided to download articles (as files) where the titles correspond to words from stdin.

### General use:

Run with:

```bash
>./wiki_beam.sh <language-code> <article-name>
```

Both the *language code* (1) and the *article name* (2) can be extracted from part 1 and 2 of the Wikipedia page URL respectively: 

```
https://___1___.wikipedia.org/wiki/___2___
```

Language codes can be found [here](https://meta.wikimedia.org/wiki/List_of_Wikipedias).

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
## auto_beam.sh:

An additional helper script dependent on the presence of wiki_beam.sh in the same directory.

This script automatically downloads (if found) a Wikipedia article with a title exactly equal to each word found in stdin.
It can, for instance, be used to download vast amounts of plain text content related to some particular text. Works with compound words (of two stems) by looking up the corresponding article for consecutively neighboring words. (e.g. United Nations). Non-alphabetical characters are ignored.

### General use:

Run with:
```bash
>cat <text-file> | ./auto_beam.sh
```

### Example:
1.
```bash
>cat LeePincombeWelshDocuments.txt | ./auto_beam.sh
Saving en-national.txt!
Saving en-the_national.txt!
Skipping en-national_executive.txt!
```
