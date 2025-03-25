# Language

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
