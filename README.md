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
- A bass.json config file to use to output just the bass notes from inversions (e.g., print B if the chord is E/B)

## Setup

### MacOS
1. Paste the cpnicepdf() shell function into your .bashrc, .zshrc, etc.
2. Either copy chordpro.json to ~/.config/chordpro/, or set up an alias so your ChordPro install always uses the flag to point to the config file wherever you've saved it.
3. Edit line 569 in your chordpro.json config to point to your nice-chord-charts.css in a Google Chrome loadable way. For example:

`569             "print"   : "file:///path/to/your/nice-chord-charts.css",`

### Windows/Linux
Same as for MacOS, but you'll need to change your cpnicepdf() function to correctly point to Chrome on your system.

## How do I use this?
Like so:

`cpnicepdf nameofyour.chordpro`

This will generate the HTML using ChordPro, and then generate the PDF using Chrome. If you don't supply a second parameter, the name of your created file in the above case would be "nameofyour.pdf". If you'd like to specify your own name, you can supply that like this:

`cpnicepdf nameofyour.chordpro nameofdesired.pdf`

It runs this:

`chordpro nameofyour.chordpro --generate=HTML > tempnicepdf.html`

And then this:

`/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --disable-gpu --print-to-pdf-no-header --print-to-pdf=nameofdesired.pdf tempnicepdf.html`

And then it cleans up:

`rm tempnicepdf.html`

## Transposing
ChordPro can also generate transposed charts:

> ### transpose
> 
> --transpose=N (short: -x)
> 
> Transposes all songs by N semi-tones. Note that N may be specified as +N to transpose upward, using sharps, or as -N to transpose downward, using flats.

To transpose We Three Kings from E to A, for example (maybe you want to capo 7), put your transpose value in as the third variable, like so:

`cpnicepdf nameofyour.chordpro nameofdesired.pdf +7`

*We may one day add a flag to serve the use case where there will be two guitars who should be capoed in different places, and then we'd generate the two desired pdfs at once. Fancy!*

## Bass Charts
Most of the time, bass players will want to know the full chords of the song, but sometimes they may want just the bass notes, especially if the chords specify a lot of inversions. In that case, you can give the optional fourth parameter:

`cpnicepdf nameofyour.chordpro nameofdesired.pdf +0 bass`

Is this a kludgy way of doing it? Yes! It should be done better. But it works! It'll run this before generating the PDF:

`chordpro nameofyour.chordpro --transpose=+0 --congfig=bass --generate=HTML > tempnicepdf.html`

So, instead of "bass", you would put in the full path to bass.json. You can also put in whatever transpose value, but you must put something there because this is done in such a kludgy way! The good news is +0 works fine!

## Troubleshooting
### The formatting isn't showing up. The PDF is ugly!
Double check that whatever you have in the "print" stylesheet path in the chordpro.json config file does indeed pull up the nice-chord-charts.css when you paste it into a browser.

Also be sure to use ChordPro's directives for start of verse {sov}, end of verse {eov}, start of chorus {soc}, and end of chorus {eoc}, everywhere you want a box, as this is what ChordPro uses to output the relevant divs in HTML.