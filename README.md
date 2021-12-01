# Nice Chord Charts
 ChordPro configurations for generating nice PDF Chord Charts via Google Chrome. I attempted to use wkhtmltopdf instead, but it doesn't support css columns properly. :(
 
# Dependencies
- ChordPro, found at [https://www.chordpro.org](https://www.chordpro.org).
- Google Chrome

# What's included here?
- A sample ChordPro file of We Three Kings. ChordPro files can also be downloaded from SongSelect.
- A CSS file to render nice HTML output for printing.
- A chordpro.json config file to help render nice HTML output for printing.

# Setup

## Mac/Linux
1. Either copy chordpro.json to ~/.config/chordpro/, or set up an alias so your ChordPro install always uses the flag to point to the config file wherever you've saved it.
2. Edit line 569 in your chordpro.json config to point to your nice-chord-charts.css in a Google Chrome loadable way. For example:

`569             "print"   : "file:///path/to/your/nice-chord-charts.css",`

# How do I use this?
Once you have a ChordPro file you're happy with, generate the HTML:

`chordpro We\ Three\ Kings.chordpro --generate=HTML > We\ Three\ Kings.html`

Then use Google Chrome in headless mode to generate the PDF. On MacOS, this looks like:

`/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --print-to-pdf-no-header --print-to-pdf=WeThreeChrome.pdf We\ Three\ Kings.html`