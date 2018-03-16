all: CSX312.pdf

csx312.pdf: $(bash echo *.jpg)
	pdfjoin --letterpaper --fitpaper false --outfile CSX312.pdf --rotateoversize false *.jpg

clean:
	rm csx312.pdf
