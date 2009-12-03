CHAPTERS =src/00-preface.pod

# If you're on a Mac, and installed Inkscape via MacPorts, you might want to
# manually uncomment the next line, and remove the one after it.
#INKSCAPE = /Applications/Inkscape.app/Contents/Resources/bin/inkscape
INKSCAPE = inkscape

default: build/nqpbook.pdf

release: build/book.pdf
	cp build/nqpbook.pdf build/nqpbook-$$(date +"%Y-%m").pdf

#build/mmd-table.pdf: src/mmd-table.svg
#	$(INKSCAPE) --export-pdf=build/mmd-table.pdf -D src/mmd-table.svg

build/nqpbook.html: $(CHAPTERS) bin/book-to-html
	perl bin/book-to-html $(CHAPTERS) > build/nqpbook.html

build/nqpbook.pdf:	build/nqpbook.tex
	cd build && pdflatex nqpbook.tex && pdflatex nqpbook.tex

build/nqpbook.tex: $(CHAPTERS) bin/book-to-latex
	perl bin/book-to-latex $(CHAPTERS) > build/nqpbook.tex

clean: 
	rm -rf build/*

.PHONY: clean

# vim: set noexpandtab
