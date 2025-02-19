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
<!-- description: end -->

## Installation


## Setup

Add the following to your `_quarto.yml` file:

```
format:
  flandersqmd-book-pdf: default
  flandersqmd-book-html: default
```

Then specify the `flandersqmd` setting in the `_quarto.yml` file.
Below is the full list of settings that can be used.

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

### Full example

```
flandersqmd:
  entity: INBO
  level: 2
  title: Title for the example website
  subtitle: The optional subtitle
  author:
    - name:
        given: Given
        family: Family
      corresponding: true
      email: given.family@vlaanderen.be
      orcid: 0000-0002-1825-0097
      affiliation:
        - Government of Flanders
    - name:
        given: Second
        family: Author
      corresponding: true
      email: second.author@vlaanderen.be
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
  cover: cover.pdf
  coverphoto: https://www.pexels.com/nl-nl/foto/hout-natuur-rood-creatief-4599227
  coverdescription: Detail of a leaf. Photo by [Skyler Ewing](https://www.pexels.com/nl-nl/@skyler-ewing-266953?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) via [Pexels](https://www.pexels.com/nl-nl/foto/hout-natuur-rood-creatief-4599227/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  ordernr: optional order number
  depotnr: optional depot number
  doi: 10.5281/zenodo.842223
  watermark: test
  public_report: true
  colophon: true
  client:
    - INBO Brussel
    - VAC Brussel ‐ Herman Teirlinck
    - Havenlaan 88 bus 73
    - 1000 Brussel
  clienturl: https://www.vlaanderen.be/inbo/en-gb
  clientlogo: logo.jpg
  cooperation:
    - INBO Brussel
    - VAC Brussel ‐ Herman Teirlinck
    - Havenlaan 88 bus 73
    - 1000 Brussel
  cooperationurl: https://www.vlaanderen.be/inbo/en-gb
  cooperationlogo: logo.jpg
```
