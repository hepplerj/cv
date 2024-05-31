default : jah-cv.pdf jah-cv-short.pdf

jah-cv.pdf : jah-cv.tex
	pdflatex -pdf $<
	latexmk -c

jah-cv-short.pdf : jah-cv-short.tex
	pdflatex -pdf $<
	latexmk -c

deploy : jah-cv.pdf
	scp jah-cv.pdf jasonhep@jasonheppler.org:~/public_html/files/

.PHONY : clean deploy copy
