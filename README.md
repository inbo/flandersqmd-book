<!-- badges: start -->
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/inbo/checklist/check_project.yml)
![GitHub](https://img.shields.io/github/license/inbo/flandersqmd-book)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/inbo/flandersqmd-book/check-project)
![GitHub repo size](https://img.shields.io/github/repo-size/inbo/flandersqmd-book)
<!-- badges: end -->

# Quarto extension providing the corporate identity of the Flemish government for reports

[Onkelinx, Thierry![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0001-8804-4216)[^aut][^cre][^inbo]
Research Institute for Nature and Forest (INBO)[^cph][^fnd]

[^inbo]: Research Institute for Nature and Forest (INBO)
[^cph]: copyright holder
[^fnd]: funder
[^aut]: author
[^cre]: contact person

**keywords**: quarto; corporate identity

<!-- community: inbo -->
<!-- version: 0.1.0 -->

<!-- description: start -->
This quarto extension builds on the quarto [book format](https://quarto.org/docs/books/) and provides the corporate identity of the Flemish government for reports.
A full example is available in the `source` folder in the [GitHub repo](https://github.com/inbo/flandersqmd-book/).
Visit https://inbo.github.io/flandersqmd-book/ to view the rendered version of the example.
<!-- description: end -->

## Installation

**1.** Start by setting up a quarto book project.
You can find more information on how to do this in the [quarto documentation](https://quarto.org/docs/books/).

**2.** Then open the terminal and go the root of your quarto book project.
Run the command below to install the quarto extension and confirm when prompted.
Once installed, you can optionally view the documentation in your browser.

```
quarto install extension inbo/flandersqmd-book
```

**3.** Replace the `project:` section in your `_quarto.yml` file with the following code:

```
project:
  type: book
  preview:
    port: 4201
    browser: true
  render:
    - "*.md"
    - "*.qmd"
    - "!LICENSE.md" #ignore LICENSE.md
    - "!README.md" #ignore README.md
  output-dir: output
```

**4.** Replace the `format:` section in your `_quarto.yml` file with the following code:

```
format:
  flandersqmd-book-html: default
  flandersqmd-book-pdf: default
```

**5.** Then specify the `flandersqmd:` section in the `_quarto.yml` file.
[Below](#flandersqmd-settings) is the full list of settings that can be used.

**6.** Update the settings in the `book:` section in the `_quarto.yml` file.
- Remove `title`, `author` and `date` information from the `book:` section.
- Update the `chapters:` subsection to include the chapters of your report.

```
book:
  downloads: pdf
  open-graph: true
  sidebar:
    logo: media/cover.png
  body-footer: '{{< footer >}}'
  navbar:
    left:
      - text: Cover
        file: index.md
    right:
      - icon: mastodon
        href: https://mastodon.online/@inbo
      - icon: facebook
        href: https://www.facebook.com/INBOVlaanderen/
      - icon: github
        menu:
          - text: Source Code
            url:  https://github.com/inbo
          - text: Report a Bug
            url:  https://github.com/inbo
    pinned: true
```

**7.** Add `{{< colophon >}}` to the top of the `index.md` file to include the colophon.

## `flandersqmd` settings

### Required settings with default values

- `entity`: The entity that is publishing the report.
  Currently only `INBO` is supported.
  Defaults to `INBO` when omitted.
- `level`: The style guide level of the report.
  `1` refers to the global corporate identity of the Flemish government.
  `2` refers to the entity level corporate identity.
  Level `2` should only be used for reports in the Dutch language written by a single entity.
  Defaults to `1` when omitted.
- `public_report`: A boolean indicating whether the report is public.
  Defaults to `true` when omitted.
  Providing a `doi` will automatically set this to `true`.
- `colophon`: display the colophon.
  Defaults to `true` when omitted, or when `doi` or `reportnr` are set.

### Required settings with no default

Missing settings are replaced by `!!! missing flandersqmd.settingname !!!` in the output.
And a `DRAFT` watermark will appear on every page.

- `title`: The title of the report.
- `author`: The author(s) of the report.
  This is a list of authors.
  Each author is a dictionary with the following keys:
  - `name`: The name of the author.
    This is a dictionary with the following keys:
    - `given`: The given name of the author.
    - `family`: The family name of the author.
  - `corresponding`: A boolean indicating whether the author is the corresponding author.
    Defaults to `false` when not set.
  - `email`: The email address of the author.
    This is only required for corresponding authors.
    It will be shown in the report when provided for corresponding authors.
  - `orcid`: The ORCID of the author.
    This if optional.
    Note that INBO requires you to provide an ORCID for all INBO personnel.
  - `affiliation`: The affiliation of the author.
    This is a list of strings.
    One item for each line.
    This is optional.
    Note that INBO requires you to provide at least `Research Institute for Nature and Forest (INBO)` as affiliation for all INBO personnel.
- `reviewer`: The reviewer(s) of the report.
  This is a list of reviewers.
  Each reviewer is a dictionary with the following keys:
  - `name`: The name of the reviewer.
    This is a dictionary with the following keys:
    - `given`: The given name of the reviewer.
    - `family`: The family name of the reviewer.
  - `email`: The email address of the reviewer.
    This is optional.
  - `orcid`: The ORCID of the reviewer.
    This if optional.
    Note that INBO requires you to provide an ORCID for all INBO personnel.
  - `affiliation`: The affiliation of the reviewer.
    This is a list of strings.
    One item for each line.
    This is optional.
    Note that INBO requires you to provide at least `Research Institute for Nature and Forest (INBO)` as affiliation for all INBO personnel.

### Mandatory settings to be set for the final version

- `doi`: The DOI of the report.
  This is only required for a public report.
  Providing a `doi` will automatically set `public_report` to `true`.
- `depotnr`: The depot number of the report.
  Only required for a public report.
- `year`: The year of the report.
- `reportnr`: The report number.
- `cover`: The cover of the report for the pdf version.
  Path to a cover file.
  Should be a pdf file.
  Will use the first page of the pdf as the cover.
- `coverphoto`: The photo on the cover.
  This is either the URL to the image or a local file path.
- `coverdescription`: The description of the cover photo.

### Optional settings

- `subtitle`: The subtitle of the report.
- `ordernr`: The order number of the report.
- `client`: The client of the report.
  E.g. their name and address.
  This is a list of strings.
  One item for each line.
- `clienturl`: The URL of the client.
- `clientlogo`: The logo of the client.
  Path to a logo file.
  Should  a format usable in both HTML and PDF.
  E.g. `jpg`, `png`, `svg`.
- `cooperation`: The cooperation partner of the report.
  E.g. their name and address.
  This is a list of strings.
  One item for each line.
- `cooperationurl`: The URL of the cooperation partner.
- `cooperationlogo`: The logo of the cooperation partner.
  Path to a logo file.
  Should  a format usable in both HTML and PDF.
  E.g. `jpg`, `png`, `svg`.
- `watermark`: A text to display as a watermark on every page.
  Will be appended to the `DRAFT` watermark in case of missing mandatory settings.

## Render your quarto report

You can render your quarto report in two main ways:  

1. **Using RStudio's Build Pane**  
   - Open your quarto book project in RStudio.
   - Click on the **Build** tab (usually found in the top-right panel).  
   - Click **Render Book** to generate all formats.
     You can click on the down arrow next to the **Render Book** button to render only a specific format.
     If no `flandersqmd-book` format is available, restart your quarto book project and try again.
   - The output format is saved to disk.

2. **Using the Terminal**  
   - Open a terminal and navigate to the folder of your quarto book
   - Run the commands below in the terminal.
     This renders the book and saves it to disk like the **Render Book** button of the **Build** tab.
     Preview renders the book and starts a live preview, automatically updating the output when changes are detected.

```sh
# render all formats
quarto render
# render only the html format
quarto render --to flandersqmd-book-html
# render only the pdf format
quarto render --to flandersqmd-book-pdf
# preview the html format
quarto preview
```  

## Full example of the `_quarto.yml` file

```
project:
  type: book
  preview:
    port: 4201
    browser: true
  render:
    - "*.md"
    - "*.qmd"
    - "!LICENSE.md" #ignore LICENSE.md
    - "!README.md" #ignore README.md
  output-dir: output

execute:
  echo: false
  freeze: auto

lang: en-GB # nl-BE, fr-FR

bibliography: references.bib

format:
  flandersqmd-book-html: default
  flandersqmd-book-pdf: default

flandersqmd:
  entity: INBO
  level: 2
  title: Title for the example website
  subtitle: The optional subtitle
  author:
    - name:
        given: Given
        family: Family
      email: given.family@vlaanderen.be
      corresponding: true
      orcid: 0000-0002-1825-0097
      affiliation:
        - Government of Flanders
    - name:
        given: Second
        family: Author
      email: second.author@vlaanderen.be
      corresponding: true
      orcid: 0000-0002-1825-0097
      affiliation:
        - Government of Flanders
    - name:
        given: Third
        family: Author
      email: third.author@vlaanderen.be
      orcid: 0000-0002-1825-0097
      affiliation:
        - Government of Flanders
  reviewer:
    - name:
        given: First
        family: Reviewer
      email: reviewer@vlaanderen.be
      orcid: 0000-0002-1825-0097
      affiliation:
        - Government of Flanders
  year: 9999
  reportnr: 3.14
  cover: media/cover.pdf
  coverphoto: https://www.pexels.com/nl-nl/foto/hout-natuur-rood-creatief-4599227
  coverdescription: Detail of a leaf. Photo by [Skyler Ewing](https://www.pexels.com/nl-nl/@skyler-ewing-266953?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) via [Pexels](https://www.pexels.com/nl-nl/foto/hout-natuur-rood-creatief-4599227/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  ordernr: optional order number
  depotnr: optional depot number
  doi: 10.5281/zenodo.842223
  watermark: This is a watermark
  public_report: true
  colophon: true
  client:
    - INBO Brussel
    - VAC Brussel ‐ Herman Teirlinck
    - Havenlaan 88 bus 73
    - 1000 Brussel
  clienturl: https://www.vlaanderen.be/inbo/en-gb
  clientlogo: media/logo.jpg
  cooperation:
    - INBO Brussel
    - VAC Brussel ‐ Herman Teirlinck
    - Havenlaan 88 bus 73
    - 1000 Brussel
  cooperationurl: https://www.vlaanderen.be/inbo/en-gb
  cooperationlogo: media/logo.jpg

book:
  downloads: pdf
  open-graph: true
  sidebar:
    logo: media/cover.png
  body-footer: '{{< footer >}}'
  chapters:
    - index.md
    - samenvatting.md
    - resume.md
    - recommendations.qmd
    - introduction.md
    - part: Typography
      chapters:
        - headings.qmd
        - fonts.qmd
        - lists.qmd
        - boxes.qmd
    - part: Other elements
      chapters:
        - crossreference.md
        - static-figure.md
        - static-table.md
        - equations.md
        - citations.md
        - language.md
    - part: Code generated content
      chapters:
        - code.qmd
        - code-figure.qmd
        - code-table.qmd
        - references.md
  appendices:
    - appendix-first.qmd
    - appendix-second.qmd
  navbar:
    left:
      - text: Cover
        file: index.md
      - text: Typography
        file: headings.qmd
      - text: Other elements
        file: crossreference.md
      - text: Code
        file: code.qmd
      - text: Appendices
        file: appendix-first.qmd
    right:
      - icon: mastodon
        href: https://mastodon.online/@inbo
      - icon: facebook
        href: https://www.facebook.com/INBOVlaanderen/
      - icon: github
        menu:
          - text: Source Code
            url:  https://github.com/inbo
          - text: Report a Bug
            url:  https://github.com/inbo
    pinned: true
```
