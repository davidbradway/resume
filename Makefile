
SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
DOCX=$(SRC:.md=.docx)
LATEX_TEMPLATE=./pandoc-templates/default.latex

all:   clean $(PDFS) $(HTML) $(DOCX)

pdf:   clean $(PDFS)
html:  clean $(HTML)
docx:  clean $(DOCX)

%.pdf:  %.md $(LATEX_TEMPLATE)
	#python resume.py tex < $< | pandoc --template=$(LATEX_TEMPLATE) -H header.tex -o $@
	# Make PDF
	pandoc -H margins.sty --bibliography mendeley.bib --csl plos.csl resume_with_citations.md -o resume.pdf
	# Make TeX
	pandoc -H margins.sty --bibliography mendeley.bib --csl plos.csl resume_with_citations.md -o resume.tex
	# Make ReST file
	pandoc -s -t rst --bibliography mendeley.bib --csl plos.csl resume_with_citations.md --output=./docs/source/resume.rst
	#pandoc --from=markdown --to=rst --output=./docs/source/resume.rst resume.md
	cd ./docs && $(MAKE) latexpdf

%.html: %.md
	#python resume.py html $(GRAVATAR_OPTION) < $< | pandoc -t html -c resume.css -o $@
	# Make HTML page
	pandoc -s --bibliography mendeley.bib --csl plos.csl resume_with_citations.md -o resume.html

	# Make ReST file
	pandoc -s -t rst --bibliography mendeley.bib --csl plos.csl resume_with_citations.md --output=./docs/source/resume.rst
	#pandoc --from=markdown --to=rst --output=./docs/source/resume.rst resume.md
	cd ./docs && $(MAKE) html
	cd ./docs && $(MAKE) singlehtml

%.docx: %.md
	# Make Word Doc
	pandoc -H margins.sty --bibliography mendeley.bib --csl plos.csl resume_with_citations.md -o resume.docx

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix
  RM = rm -f
endif

clean:
	$(RM) *.out *.gz *.log *.aux
	cd ./docs && $(MAKE) clean

$(LATEX_TEMPLATE):
	git submodule update --init
