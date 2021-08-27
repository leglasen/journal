VOLUME ?= 00001
OUTPUT = _output

help:
	@echo "Usage: make all"

$(OUTPUT):
	mkdir $@

$(OUTPUT)/bibliographie.bib:
	cp bibliographie.bib $@

$(OUTPUT)/newspaper-mod.sty:
	cp newspaper-mod.sty $@

all: $(OUTPUT) $(OUTPUT)/bibliographie.bib $(OUTPUT)/newspaper-mod.sty
	cp volume-*.tex $(OUTPUT)
	cd $(OUTPUT); 				\
	for volume in *.tex; do 		\
		latex $${volume%.tex}; 		\
		bibtex $${volume%.tex};		\
		latex $${volume%.tex};		\
		pdflatex $${volume%.tex};	\
	done

clean:
	rm $(OUTPUT)/*
