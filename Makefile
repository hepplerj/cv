all: jah-vita.pdf jah-vita-short.pdf jah-resume.pdf

jah-vita.pdf: jah-cv.tex web-cv.tex
	pdflatex jah-cv.tex
	latexmk -c

jah-vita-short.pdf: jah-cv-short.tex web-cv-short.tex
	pdflatex jah-cv-short.tex
	latexmk -c

jah-resume.pdf: jah-resume.tex web-jah-resume.tex
	pdflatex jah-cv.tex
	latexmk -c

web-cv-short.tex: web-cv-short.md
	pandoc $^ -o $@

web-cv.tex: web-cv.md
	pandoc $^ -o $@

web-resume.tex: web-resume.md
	pandoc $^ -o $@

clean:
	latexmk -c
	rm -f jah-cv.pdf
	rm -f jah-cv-short.pdf
	rm -f jah-resume.pdf

deploy:
	scp jah-cv.pdf jasonhep@jasonheppler.org:~/public_html/jasonheppler/downloads/pdf/

.PHONY : clean deploy
