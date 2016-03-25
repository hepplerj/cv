jah-vita.pdf : jah-cv.tex web-cv.tex
	pdflatex jah-cv.tex
	latexmk -c

web-cv.tex : web-cv.md
	pandoc $^ -o $@

clean :
	latexmk -c
	rm -f jah-vita.pdf

deploy :
	scp jah-vita.pdf reclaim:~/public_html/jasonheppler/downloads/pdf/

.PHONY : clean deploy
