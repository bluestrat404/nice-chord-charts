#!/bin/bash
# add this to your bashrc/zshrc or what have you

# cpnicepdf takes a ChordPro file and generates a PDF via HTML and Chrome's headless mode
# Parameters:
#	1: ChordPro File
#	2: PDF Output Name (with ".pdf")
#	3 (optional): Steps to tell ChordPro to transpose (e.g., +2 transposes up two half steps using sharps. Use - (minus) to tell ChordPro to print flats)
cpnicepdf() {
	transpose=0
	mode=""

	if [ -z ${2+x} ]
	then
		pdffilename="${1/chordpro/pdf}"
	else
		pdffilename=$2
	fi
	if [ ! -z ${3+x} ]
	then
		transpose=$3
	fi
	if [ ! -z ${4+x} ]
	then
		mode=" --config=$4"
	fi

	echo "chordpro $1 --transpose=$transpose $mode --generate=HTML > tempnicepdf.html"	

	chordpro $1 --transpose=$transpose $mode --generate=HTML > tempnicepdf.html	
	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --print-to-pdf-no-header --print-to-pdf=$pdffilename tempnicepdf.html
	rm tempnicepdf.html
}