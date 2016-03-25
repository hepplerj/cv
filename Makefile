jah-cv.pdf : jah-cv.tex web-cv.tex
	pdflatex jah-cv.tex
	latexmk -c

web-cv.tex : web-cv.md
	pandoc $^ -o $@

clean :
	latexmk -c
	rm -f jah-cv.pdf

deploy :
	scp jah-cv.pdf reclaim:~/public_html/jasonheppler.org/downloads/pdf/

.PHONY : clean deploy
