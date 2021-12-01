# Nice Chord Charts
 ChordPro configurations for generating nice PDF Chord Charts via Google Chrome. I attempted to use wkhtmltopdf instead, but it doesn't support css columns properly. :(
 
## Why?
1. Many chord charts are ugly or difficult to use. This makes nice ones. :)
2. Sometimes you want to change chords and arrangements from what you're able to download. Using this workflow saves you from having to edit PDFs directly or recreate chord charts from scratch.
 
## Dependencies
- ChordPro, found at [https://www.chordpro.org](https://www.chordpro.org).
- Google Chrome

## What's included here?
- A sample ChordPro file of We Three Kings. ChordPro files can also be downloaded from SongSelect.
- A CSS file to render nice HTML output for printing.
- A chordpro.json config file to help render nice HTML output for printing.

## Setup

### Mac/Linux
1. Either copy chordpro.json to ~/.config/chordpro/, or set up an alias so your ChordPro install always uses the flag to point to the config file wherever you've saved it.
2. Edit line 569 in your chordpro.json config to point to your nice-chord-charts.css in a Google Chrome loadable way. For example:

`569             "print"   : "file:///path/to/your/nice-chord-charts.css",`

## How do I use this?
In short, generate the HTML using ChordPro, and then generate the PDF using Chrome.

Once you have a ChordPro file you're happy with, generate the HTML:

`chordpro We\ Three\ Kings.chordpro --generate=HTML > temp.html`

Then use Google Chrome in headless mode to generate the PDF. On MacOS, this looks like:

`/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --print-to-pdf-no-header --print-to-pdf=We\ Three\ Kings\ -\ E.pdf temp.html`

## Bonus Tip: Transposing
ChordPro can also generate transposed charts (e.g., for different capo positions):

> ### transpose
> 
> --transpose=N (short: -x)
> 
> Transposes all songs by N semi-tones. Note that N may be specified as +N to transpose upward, using sharps, or as -N to transpose downward, using flats.

To transpose We Three Kings from E to A, for a capo on 7, we could use:

`chordpro We\ Three\ Kings.chordpro --transpose=+7 --generate=HTML > temp.html`

Then generate the PDF using Chrome as above.

## Troubleshooting
### The formatting isn't showing up.
Double check that whatever you have in the "print" stylesheet path in the chordpro.json config file does indeed pull up the nice-chord-charts.css when you paste it into a browser.

Also be sure to use ChordPro's directives for start of verse {sov}, end of verse {eov}, start of chorus {soc}, and end of chorus {eoc}, everywhere you want a box, as this is what ChordPro uses to output the relevant divs in HTML.