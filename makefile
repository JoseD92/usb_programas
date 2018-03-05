all: programa.pdf

programa.pdf: ./other/numeros.pdf
	for i in *.doc; do libreoffice --headless --convert-to pdf $$i; done
#	pdfunite *.pdf programa0.pdf
	pdftk *.pdf cat output programa0.pdf
	./other/addNumbers.sh programa0.pdf other/numeros.pdf programa.pdf
	rm programa0.pdf
	for i in *.doc; do rm "`echo "$$i" | cut -d'.' -f1`.pdf"; done


clean:
	-rm programa.pdf
	-for i in *.doc; do rm "`echo "$$i" | cut -d'.' -f1`.pdf"; done
