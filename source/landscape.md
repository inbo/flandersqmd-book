# Landscape {.landscape}

This is only relevant for the pdf version of the report.

## Entire chapter

To create an entire chapter in landscape mode add ` {.landscape}` at the end of the chapter title.

```
This will appear in portrait mode.


<!-- landscape mode starts here -->
# My chapter title {.landscape}

This will appear in landscape.

<!-- landscape mode ends here -->

# Next chapter

This will appear in portrait mode again.
```

## Part of a chapter

In case you only need a section of a chapter to be in landscape then start this section with  `::: {.landscape}` and end it with `:::`.
Note that this won't work with chapter titles.
They will remain in portrait mode.

```
This will appear in portrait mode.


::: {.landscape}
# My chapter title
<!-- landscape mode starts here -->

This will appear in landscape.
<!-- landscape mode ends here -->
:::

This will appear in portrait mode again.
```
