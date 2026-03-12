# Language

## Setting the language

Set the main language of the document with the `lang:` tag in `_quarto.yml`.
@tbl-language lists a few of the available tags.

| Language        | Tag   |
| ----------------| ----- |
| British English | en-GB |
| Belgian Dutch   | nl-BE | <!-- spell-check: ignore --> 
| French          | fr-FR |
| German          | de-DE |

: Some of the available language tags {#tbl-language}

Sometimes you need another language in a report.
Quarto provides two options to indicate what language to use.
The first syntax is `[text in other language]{lang=tag}`.
This syntax is useful when you use a different language for a few words of sentences.
Use the second syntax when you use a different language for one or more paragraphs.

`::: {lang=tag}`

`Add the text with a different language.`

`:::`

butterfly [vlinder]{lang=nl-BE} butterfly
[papillon]{lang=fr-FR} butterfly
[Schmetterling]{lang=de-DE} butterfly

::: {lang=nl-BE}

Dit stuk tekst is in het Nederlands geschreven.
Je kan zelfs korte stukjes [en Français]{lang=fr-FR} toevoegen.

vlinder [papillon]{lang=fr-FR}
[Schmetterling]{lang=de-DE}.

:::

Note that you cannot use the main document language as a secondary language.

## Hyphenation

When rendering a pdf, the LaTeX engine will hyphenate words if it results in a nicer whitespace.
This automatic hyphenation sometime splits words at a wrong point.
You can add the correct splits of such words to the `flandersqmd` section of `_quarto.yml`.
Add every word with dashes at the locations where you want to allow the hyphenation to happen.
Then the LaTeX engine will only consider those locations to hyphenate the word.
The example below lists three words: `flanderqmd` which may not be hyphenated, `document` which can only be hyphenated at a single position and `secondary` which can be hyphenated at three locations.

```
flandersqmd:
  hyphenation:
    - flandersqmd
    - docu-ment
    - se-con-da-ry
```