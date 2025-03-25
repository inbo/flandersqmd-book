# Cross references {#sec-crossreference}

## Internal cross references {#sec-internal}

Quarto website projects render all files separately.
An important consequence it that it makes internal cross references between files not possible.

### Default internal references

| type       | display             |
| ---------- | ------------------- |
| level 1    | @sec-crossreference |
| level 2    | @sec-internal       |
| level 3    | @sec-level-3        |
| level 4    | @sec-level-4        |
| figure     | @fig-static-1       |
| table      | @tbl-static-align   |
| equation   | @eq-som   |

### Custom internal references

You can display only the number of the internal reference or replace the custom name with a custom name.

| type       | only number            | custom                       |
| ---------- | ---------------------- | ---------------------------- |
| level 1    | [-@sec-crossreference] | [custom @sec-crossreference] |
| level 2    | [-@sec-internal]       | [custom @sec-internal]       |
| level 3    | [-@sec-level-3]        | [custom @sec-level-3]        |
| level 4    | [-@sec-level-4]        | [custom @sec-level-4]        |
| figure     | [-@fig-static-1]       | [custom @fig-static-1]       |
| table      | [-@tbl-static-align]   | [custom @tbl-static-align]   |
| equation   | [-@eq-som]             | [custom @eq-som]             |

## External references

Don't use URLs as is (like http://www.inbo.be or mailto:nobody@inbo.be).

Instead use the explicit markdown syntax like [http://www.inbo.be](http://www.inbo.be), [Google](http://google.be) or [e-mail](mailto:nobody@inbo.be)

# Referenceable items

### Figure {#sec-level-3}

![Figure caption with reference anchor](media/kohlrabi-2266665-klein.jpg){#fig-static-1}

#### Tables {#sec-level-4}

| Default | Left | Right | Center |
|---------|:-----|------:|:------:|
| 12      | 12   |    12 |   12   |
| 123     | 123  |   123 |  123   |
| 1       | 1    |     1 |   1    |

: Demonstration of pipe table syntax with reference anchor {#tbl-static-align}

#### Equations {#sec-level-5}

$$\bar{X} = \sum_{i = 1}^NX_i$${#eq-som}
