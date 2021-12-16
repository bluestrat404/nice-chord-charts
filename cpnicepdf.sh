#!/bin/bash
# add this to your bashrc/zshrc or what have you

# cpnicepdf takes a ChordPro file and generates a PDF via HTML and Chrome's headless mode
# Parameters:
#	1: ChordPro File
#	2: PDF Output Name (with ".pdf")
#	3 (optional): Steps to tell ChordPro to transpose (e.g., +2 transposes up two half steps using sharps. Use - (minus) to tell ChordPro to print flats)
cpnicepdf() {
         if [ -z ${3+x} ]
         then
                 chordpro $1 --generate=HTML > tempnicepdf.html
         else
                 chordpro $1 --transpose=$3 --generate=HTML > tempnicepdf.html
         fi

         /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --print-to-pdf-no-header --print-to-pdf=$2 tempnicepdf.html

         rm tempnicepdf.html
}
