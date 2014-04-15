This is a simple Markdown resumé template, LaTeX header, and pre-processing
script that can be used with [Pandoc](http://johnmacfarlane.net/pandoc/) to
create professional-looking PDF and HTML output.

Dependencies
------------

* Pandoc >= 1.9 (you can adjust the Makefile to use an earlier version -- the
  arguments format changed)
* Python >= 2.7
* A Tex installation with pdflatex and the Tex Gyre Pagella font, and some
  packages needed by pandoc.  On Ubuntu you can get this by installing
  `texlive`, `texlive-latex-extra`, and `tex-gyre`.

Usage
-----

Simply run `make` to generate PDF and HTML versions of each .md file in the
directory.

In order to enable visually appealing display of contact information, the
Markdown is passed through a Python script that looks for contact details
beginning on the fourth line and moves them into a right-aligned, zero-height
box at the top of the document.  Lines with bullets (•) will be treated as
separate contact lines in the output.

By default, an image of your [Gravatar](http://www.gravatar.com) will be added
to the HTML resumé.  This feature can be disabled by setting the environment
variable `GRAVATAR_OPTION=--no-gravatar`.
