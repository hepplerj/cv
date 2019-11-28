all: jah-vita.pdf jah-vita-short.pdf 

# Full CV
jah-vita.pdf: jah-cv.tex web-cv.tex
	pdflatex jah-cv.tex
	latexmk -c

web-cv.tex: web-cv.md
	pandoc $^ -o $@

# Short CV
jah-vita-short.pdf: jah-cv-short.tex web-cv-short.tex
	pdflatex jah-cv-short.tex
	latexmk -c

web-cv-short.tex: web-cv-short.md
	pandoc $^ -o $@

# Clean
clean:
	latexmk -c
	rm -f jah-cv.pdf
	rm -f jah-cv-short.pdf

# Deploy
deploy:
	scp jah-cv.pdf jasonhep@jasonheppler.org:~/public_html/files/

.PHONY : clean deploy
