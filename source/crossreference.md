# Cross references {#sec-crossreference}

## Internal cross references {#sec-internal}

### Default internal references

| type       | display             |
| ---------- | ------------------- |
| level 1    | @sec-crossreference |
| level 2    | @sec-internal       |
| level 3    | @sec-heading-3      |
| level 4    | @sec-heading-4      |
| figure     | @fig-static-1       |
| table      | @tbl-style-default  |
| equation   | @eq-som             |

### Custom internal references

You can display only the number of the internal reference or replace the custom name with a custom name.

| type       | only number            | custom                       |
| ---------- | ---------------------- | ---------------------------- |
| level 1    | [-@sec-crossreference] | [custom @sec-crossreference] |
| level 2    | [-@sec-internal]       | [custom @sec-internal]       |
| level 3    | [-@sec-heading-3]      | [custom @sec-heading-3]      |
| level 4    | [-@sec-heading-4]      | [custom @sec-heading-4]      |
| figure     | [-@fig-static-1]       | [custom @fig-static-1]       |
| table      | [-@tbl-style-default]  | [custom @tbl-style-default]  |
| equation   | [-@eq-som]             | [custom @eq-som]             |

## External references

Don't use URLs as is (like http://www.inbo.be or mailto:nobody@inbo.be).

Instead use the explicit markdown syntax like [http://www.inbo.be](http://www.inbo.be), [Google](http://google.be) or [e-mail](mailto:nobody@inbo.be)
