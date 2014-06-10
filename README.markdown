[See the blog post](http://cmwelsh.com/beautiful-resumes-with-markdown-and-latex)

This is a simple Markdown resumé template, LaTeX header, and pre-processing
script that can be used with [Pandoc](http://johnmacfarlane.net/pandoc/)
and [Sphinx](http://sphinx-doc.org) to create professional-looking PDF and
HTML output.

Dependencies
------------

* Pandoc >= 1.9 (you can adjust the Makefile to use an earlier version -- the
  arguments format changed)
* Python >= 2.7
* A Tex installation with pdflatex, the Tex Gyre Pagella font, and some
  packages needed by pandoc.  On Ubuntu, do
  `sudo apt-get install haskell-platform texlive texlive-latex-extra tex-gyre`.
  On Mac and Windows
  see [Pandoc install](http://johnmacfarlane.net/pandoc/installing.html)
* Sphinx (tested with v1.1.3)  
  On Ubuntu do `sudo apt-get install python-sphinx`. On Mac and Windows see
  [Sphinx install](http://sphinx-doc.org/latest/install.html)

Usage
-----

Simply run `make` to generate a nicely formatted PDF. A simple HTML version is
created in the same directory (see notes on Docs below for more options).
Files are created for each .md file in the directory, so if several resumes
exist, they will all be processed. The 'resume.md' file will be used to make
a pretty HTML version using project documentation tools as described in the
next section.

In order to enable visually appealing display of contact information, the
Markdown is passed through a Python script that looks for contact details
beginning on the fourth line and moves them into a right-aligned, zero-height
box at the top of the document.  Lines with bullets (•) will be treated as
separate contact lines in the output.

By default, an image of your [Gravatar](http://www.gravatar.com) will be added
to the simple HTML resumé.  This feature can be disabled by setting the environment
variable `GRAVATAR_OPTION=--no-gravatar`.


Read The Docs Configuration
---------------------------
In addition to the simple HTML file created in the root of the project,
Sphinx enables writing out many more formats in the ./doc/ directory.
When `make` is run for resume.md, Pandoc is called, which converts the
resume to reStructuredText format (resume.rst) in the ./docs/source/
directory. Several formats, such as HTML, PDF, and others, are possible.
Readthedocs.org can be configured to watch your Github resume repository.
When changes are pushed to Github, a webhook is activated, and Readthedocs
compiles HTML and long PDF versions of the resume. See the following video
tutorial to set it all up!
[![ReadTheDocs Github automated build tutorial](http://img.youtube.com/vi/oJsUvBQyHBs/0.jpg)](http://www.youtube.com/watch?v=oJsUvBQyHBs)
