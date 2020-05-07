# Readme

## Developing for the Apple II

You need to install:

- **ACME Corss-Assembler** - https://sourceforge.net/projects/acme-crossass/. Can be installed with `sudo aptitude install acme`
- **AppleWin emulator** - In Linux you can run it with wine.
- **AppleCommander** - You can download the GUI and CLI from [[Github]](https://github.com/AppleCommander/AppleCommander). They are two `.jar`.

## Directory contents

This directory has assorted Apple II resources used for development / demos.

- `AppleWin` - This directory has an emulator for the Apple 2 that runs under Windows. It runs pretty decently in Linux via wine
- `roms` - This folder has Apple 2 ROMS that work on Mame.
    - `Roms Apple II - Mame 0.219` - This directory has the Apple II Roms that work with Mame version 0.219. To use mame
`mame -rp <this-path> apple2c`
    - `Other Roms` - Other miscelanous roms that worked on older versions of Mame which don't seem to work now.
- `FRENCH_TOUCH_VAULT` - This has two tools from [French Touch Vault](http://fr3nch.t0uch.free.fr/) group used to generate disk images which can be read by the Apple and/or emulator.
- `ftp.apple.asimov.net` - This has two directories I downloaded from `ftp.apple.asimov.net`: `/pub/apple_II/documentation/programming/6502assembly` and `/pub/apple_II/documentation/sourcecode`.
- `Docs` - This directory has articles and posts I've download from different sources.
    - [The Big Tip Book for the Apple II Series](docs/Big_Tip_Book_OCR.pdf) - This is a book by the infamous Beagle Brothers.
    - `apple-ii-video-timing.md` - An interesting article describing how the video is rendered on an Apple II
    - `softalk-video-timing-article.md` - A magazine article mentioned inthe previous article also related to video timings.
- `linapple` - This has an open source Apple II emulator for Linux. Its basically a `git clone` of [this repo](https://github.com/linappleii/linapple)

- `demos`

This directory has several cool demos

- `demos/Mad1` - Effects from the French Touch Vault
- `demos/Mad2` - Effects from the French Touch Vault
- `demos/Mad3` - Effects from the French Touch Vault
- `demos/dae353b` - Sizecoding for the Apple II: 353 bytes

This directory has assorted Apple II resources used for development / demos.

### Tools

The `tools` directory has several tools I downloaded and might need:

- `env.sh` - setups some environment variables
   - `ac` an alias to run AppleCommander CLI client
   - `linapple` an alias to run the emulator with the conf in this directory
- `ac.jar` - Is a link to the `.jar` file of the AppleCommander CLI client
- `dw.py` - Is tool used by the "French Touch Vault" guys to modify a disk image
- `blank-dos.dsk` - A Blank DOS image
- `linapple.conf` - Default configuration for LinApple
- `DiskBrowser.jar` - Diskbrowser tool to inspect `dsk` images.

### Random notes


- To use Mame: You need to have the apple2c.zip **on the same directory** where you're running mame then do:

`mame -verbose -debug -rp . apple2c -flop1 ../../tests/dos-3.3.dsk`
