jah-cv.pdf : jah-cv.tex web-cv.tex
	pdflatex jah-cv.tex
	latexmk -c

copy-web-cv :
#	cp ~/dev/lincolnmullen.com/source/cv/index.markdown web-cv.md

web-cv.tex : web-cv.md
	pandoc $^ -o $@

clean :
	latexmk -c
	rm -f jah-cv.pdf

#deploy :
#	scp jah-cv.pdf reclaim:~/public_html/lincolnmullen.com/files/

.PHONY : clean deploy copy
