#!/bin/bash
# add this to your bashrc/zshrc or what have you

# cpnicepdf takes a ChordPro file and generates a PDF via HTML and Chrome's     headless mode
cpnicepdf() {
        chordpro $1 --generate=HTML > tempnicepdf.html
        /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --print-to-pdf-no-header --print-to-pdf=$2 tempnicepdf.html
        rm tempnicepdf.html
}
