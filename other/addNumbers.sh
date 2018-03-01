#!/bin/sh

# burst newbook into its component pages and extract total pages
pdftk $1 burst output book_%04d.pdf
cat doc_data.txt | grep NumberOfPages > nu_pages.txt
nu_pages=`mawk '{print $2}' nu_pages.txt`

# burst the page number file into its component pages
pdftk $2 burst output nums_%04d.pdf

# start converting pages from page 2
x=1 # initialize x

# place the page numbers on each page of newbook
while [ "$x" -le "$nu_pages" ]; do

     if [ "$x" -lt 10 ]; then
    pdftk book_000"$x".pdf background nums_000"$x".pdf output fin_000"$x".pdf
         echo "Finished page $x of $nu_pages."
         x=$(($x+1))

     elif [ "$x" -lt 100 ]; then
    pdftk book_00"$x".pdf background nums_00"$x".pdf output fin_00"$x".pdf
         echo "Finished page $x of $nu_pages."
         x=$(($x+1))

     elif [ "$x" -lt 1000 ]; then
    pdftk book_0"$x".pdf background nums_0"$x".pdf output fin_0"$x".pdf
         echo "Finished page $x of $nu_pages."
         x=$(($x+1))

     fi
done


# create the new PDF file and move it to the original directory
pdftk  fin_*.pdf cat output $3

# clean up the mess and exit
rm book_*.pdf nums_*.pdf fin_*.pdf nu_pages.txt doc_data.txt

echo " "
echo "All done!"
echo " "
exit
