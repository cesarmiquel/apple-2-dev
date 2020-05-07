# Apple II / II+ / IIe / IIc memory maps

## Map 1

Jon Relay's Apple II Info Archives

### All Apple II Computers
```
$0000 - $00FF (0 - 255): Zero Page
$0100 - $01FF (256 - 511): 6502 Processor Stack
$0200 - $02FF (512 - 767): GETLN Line Input Buffer
$0300 - $03CF (768 - 975): Free Space for Machine Language, Shape Table, etc.
$03D0 - $03FF (976 - 1023): DOS, ProDOS, and Interrupt Vectors
$0400 - $07FF (1024 - 2047): Text Video Page and Peripheral Screenholes
$0800 - $0BFF (2048 - 3071): Text Video Page 2 or Applesoft Program and Variables
$0C00 - $1FFF (3072 - 8191): Free Space for Machine Language, Shapes, etc.
(might be overwritten if you use a lot of variables or BASIC program is long)
$2000 - $3FFF (8192 - 16383): High Resolution Graphics Page 1
$4000 - $5FFF (16384 - 24575): High Resolution Graphics Page 2
$6000 - $95FF (24576 - 38399): Applesoft String Data
(may have a little space free)
(some BASIC programs move the variables all the way up to $4000 or even $6000)
```

### DOS 3.2 / 3.3 and Custom DOSes

```
$9600 - $9CFF (38400 - 40191): Disk I/O Buffers
$9D00 - $BFFF (40192 - 49151): DOS Routines
(memory below $9600 can also be used for disk buffers via MAXFILES command)
```

### ProDOS
```
$9600 - $99FF (38400 - 39423): BASIC.SYSTEM I/O Buffers
$9A00 - $BEFF (39424 - 48895): Currently running SYS file
$BF00 - $BFFF (48896 - 49151): ProDOS Kernel Global Page
(memory below $9600 can also be used for disk buffers by opening more files)
```

### All Apple II Computers
```
$C000 - $C0FF (49152 - 49407): Soft Switches and Status Locations
$C100 - $C7FF (49408 - 51199): Peripheral Card Memory
$C800 - $CFFF (51200 - 53247): Extended Memory for Peripheral Card in Use
```

### Apple IIe
```
$C100 - $C2FF (49408 - 49919): Extensions to System Monitor
$C300 - $C3FF (49920 - 50175): 80-Column Display Routines
$C400 - $C7FF (50176 - 51199): Self-Test Routines
$C800 - $CFFF (51200 - 53247): More 80-Column Display Routines
```

### Apple IIc and sometimes IIgs
```
$C100 - $C2FF (49408 - 49919): Serial Firmware
$C300 - $C3FF (49920 - 50175): 80-Column Firmware
$C400 - $C4FF (50176 - 50431): Mouse Firmware
$C500 - $C6FF (50432 - 50943): Floppy Disk Drive Firmware
$C700 - $C7FF (50944 - 51199): AppleTalk Firmware
$C800 - $CFFF (51200 - 53247): Extended Memory for Periph Card
```

### Apple IIe, IIc, IIgs, and II+ with Applesoft ROM Language Card
```
$D000 - $F7FF (53248 - 63487): Applesoft Interpreter
$F800 - $FFFF (63488 - 65535): System Monitor
```

### Apple II and II+ with Integer ROM Language Card
```
$D000 - $D7FF (53248 - 55040): Programmer's Aid #1 ROM
$D800 - $DFFF (55041 - 57343): Empty (No RAM or ROM)
$E000 - $F7FF (57344 - 63487): Integer BASIC / Mini-Assembler / Sweet16
$F800 - $FFFF (63488 - 65535): System Monitor
```

### Apple IIe, IIc, and IIgs
```
$D000 - $DFFF (53248 - 57343): Bank-Switched RAM (2 Banks RAM, 1 Bank ROM)
$E000 - $FFFF (57344 - 65535): Bank-Switched RAM (1 Bank RAM, 1 Bank ROM)
```

## Zero page usage

```
             Apple II Zero Page Usage

                        Lo Nibble of Address
Hi
Nib  0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
     --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
 0 | A~  A~  A   A   A   A   -   -   -   -   A   A   A   AI  A   A
 1 | A   A   A   A   A   A   A   A   A   A   A   A   A   A   -   M*
 2 | M   M   M   M   M3  M   MA3 MA3 M3  M3  M3  M3  MA3 MA3 M3  MA3
 3 | MA  M   MA  MA3 M   M3  M3B M3B M3B M3B M~  M~  MA3~MA3~MA3~MA3~
 4 | M3~ M3~ M3~ M3~ M3~ M3~ M3~ M3~ M3~ M3~ I3~ I3~ I3~ I3~ M~  M
 5 | MA  MA  MA  MA  MA  MAI AI  AI  AI  AI  AI  AI  AI  AI  AI  AI
 6 | AI  AI  AI  AI  AI  AI  AI  AI3 AI3 AI3 AI3 AI  AI  AI  AI  AI3
 7 | AI3 AI  AI  AI3 AI3 AI  AI3 AI  AI  AI  AI  AI  AI  AI  AI  AI
 8 | AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI
 9 | AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI
 A | AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI3
 B | AI3 AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI
 C | AI  AI  AI  AI  AI  AI  AI  AI  AI  AI  AI3 AI3 AI3 AI3 I   I
 D | AI  AI  AI  AI  AI  AI  AI3 I   AI3 AI3 AI  AI  AI  AI  AI3 AI
 E | A   A   A   A   A   A   A   A   A   A   A   -   -   -   -   -
 F | A   A   A   A   A   A   A   A   A   A   -   -   -   -  I   AI
 

M = Used by Monitor; * used in early Apple IIe ROMs-- now free
A = Used by Applesoft BASIC
I = Used by Integer BASIC
3 = Used by DOS 3.3
~ = Used by ProDOS ($40-$4E is saved before and restored after use)
B = Used by ProDOS BASIC.SYSTEM (also uses all Applesoft locations)
- = Free; not used

--Bryan Dunphy, Michael J. Mahon, Rubywand 
```

## Information relating to $C000 - $C0FF

                            Write             POKE
          80STORE    off    $C000             49152,0
                     on     $C001             49153,0
          RAMRD      off    $C002             49154,0
                     on     $C003             49155,0
          RAMWRT     off    $C004             49156,0
                     on     $C005             49157,0
          PAGE2      off    $C054             49236,0
                     on     $C055             49237,0
          HIRES      off    $C056             49238,0
                     on     $C057             49239,0

`$C000 = KBD or CLR80COL`
Reading this byte is the OFFICIAL method of reading the keyboard.  Writing this byte disables 80-column bank switching--subsequent accesses to $C054 and $C055 select text, lo-res, or hi-res page 1 or 2 respectively.  This is one half of a two-way switch--writing to $C001 (SET80COL) causes $C054 and $C055 to become a bank-select switch, selecting between the main-bank video buffer (containing odd-numbered columns) and the auxiliary video buffer (containing even-numbered columns).  When this mode is enabled, display page 2 is not available.

`$C002 = RDMAINRAM`
Reading this byte returns the ASCII value of the most recent keypress.  Writing to this byte causes the auxiliary 64K of RAM to be DISABLED for reading (subsequent memory reads will come from the main RAM bank).  This is one half of a two-way switch--writing to $C003 (RDCARDRAM) selects the auxiliary RAM for reading.


`$C004 = WRMAINRAM`
Reading this byte returns the ASCII value of the most recent keypress.  Writing to this byte causes the auxiliary RAM to be DISABLED for writing (subsequent memory writes will go to the main RAM bank). This is one half of a two-way switch--writing to `$C005` (`WRCARDRAM`) selects the auxiliary RAM for writing.

`$C008 = SETSTDZP`
Reading this byte returns (what else?) the ASCII value of the latest keypress.  Writing to this byte selects the main-bank zero-page, stack, and language-card area for reading and writing.  This is one half of a two-way switch--writing to $C009 (SETALTZP) selects the auxiliary-bank zero-page, stack, and language-card ares for reading and writing.

`$C019 = RDVBLBAR`
If the high bit of this byte is CLEAR, then the video circuitry is doing "vertical blanking," which basically means moving the electron gun from the bottom of the screen back to the top.  You can use this bit to synchronize your drawing with the video circuitry to do all sorts of neat tricks.  (In the Apple IIGS, for some reason this bit has the opposite behavior-- vertical blanking is occurring when this bit is SET.)

`$CFFF = CLRROM`
Accessing this location causes all cards in all slots to disable their $C800-$CFFF ROMs.

To display the double hi-res mode, set the following soft switches:

`$C00D = 80COL`
Write to it to turn on 80 column switch

`$C050 = GR`
Read/write to it to switch to graphics mode. If you read `$C050` has the value of the screen memory we are currently displaying on the screen

`$C051 = TEXT`
Read/write to it to switch to text mode.

`$C052 = FULL_SCREEN`
Read/write to it to enable mixed mode.

`$C053 = MIXED_MODE`
Read/write to it to enable mixed mode.

`$C054 = SELECTPG1`
Read/write to select page 1

`$C055 = SELECTPG2`
Read/write to select page 2

`$C056 = LOWRES`
Read/write to select Low res

`$C057 = HIRES`
Read or write to it to set Hi-resolution (280x190)

`$C05E = MIXED_MODE`
Read/write to it to 'Turn off AN3 for double hi-res'


```
             AN3       $C05E             49246
             MIXED     $C053             49235

                       In the monitor    In AppleSoft
                       Write             POKE
             80COL     $C00D             49165,0
```


## Enable double hi-res

     C057      (for hi-res)
     C050      (for graphics)
     C053      (for mixed mode)
     C05E      Turns off AN3 for double hi-res
     C00D:0    Turns on the 80COL switch

The auxiliary memory consists of several different sections, which you can select by using the soft switches listed below. A pair of memory locations is dedicated to each switch. (One location turns the switch on; the other turns it off.) You activate a switch by writing to the appropriate memory location. The write instruction itself is what activates the switch; therefore, it does not matter what data you write to the memory location. The soft switches are as follows:

```
                            In the monitor    In AppleSoft
                            Write             POKE
          80STORE    off    $C000             49152,0
                     on     $C001             49153,0
          RAMRD      off    $C002             49154,0
                     on     $C003             49155,0
          RAMWRT     off    $C004             49156,0
                     on     $C005             49157,0
          PAGE2      off    $C054             49236,0
                     on     $C055             49237,0
          HIRES      off    $C056             49238,0
                     on     $C057             49239,0
```

## Screen holes

Source: https://retrocomputing.stackexchange.com/questions/2534/what-are-the-screen-holes-in-apple-ii-graphics

1. What are screen holes?

The Apple II video architecture is based around a text display of 40 columns by 24 rows. Woz had already built an ARPANET terminal for a TV, and said in his book iWoz that "Forty columns was the limit of American TVs".

To map those 40 column rows into memory sequentially would for various reasons have increased the chip count - something Woz strove to minimize. He could have mapped 40 columns to 64 bytes and wasted 24 bytes per row, but every byte was precious back then. As a compromise he mapped 3 rows to each 128 byte block, leaving 8 bytes unused in each of the 8 blocks - the screen holes.

This decision wasn't made in isolation. The larger design includes the video scanner which reads this memory (refreshing DRAM in the process) and passes it to the video generation circuit. The logic of the scanner imposes further order on the mapping: each of the three rows in one 128-byte block resides on a different third of the screen. Figure 5.4 from Sather's Understanding the Apple //e:

128-byte video memory segments consist of three 40-byte sections, each mapped into a different part (third) of the video screen

Sather's books have an excellent discussion on the how the bytes in memory map to the display for each video mode. Here are the address ranges for TEXT/LORES page 1 memory from Figure 5.5.

```
      TOP/         MIDDLE/      BOTTOM/      (SCREEN HOLES)
BASE  FIRST 40     SECOND 40    THIRD 40     UNUSED 8
ADDR  #  RANGE     #  RANGE     #  RANGE     RANGE
$400  00 $400-427  08 $428-44F  16 $450-477  $478-47F
$480  01 $480-4A7  09 $4A8-4CF  17 $4D0-4F7  $4F8-4FF
$500  02 $500-527  10 $528-54F  18 $550-577  $578-57F
$580  03 $580-5A7  11 $5A8-5CF  19 $5D0-5F7  $5F8-5FF
$600  04 $600-627  12 $628-64F  20 $650-677  $678-67F
$680  05 $680-6A7  13 $6A8-6CF  21 $6D0-6F7  $6F8-6FF
$700  06 $700-727  14 $728-74F  22 $750-777  $778-77F
$780  07 $780-7A7  15 $7A8-7CF  23 $7D0-7F7  $7F8-7FF
TEXT/LORES page 2 follows the same pattern - just add $400 to the addresses. In fact HIRES pages 1 and 2 also follow exactly the same pattern, but repeated 8 times each from $2000 and $4000.
```


In summary, screen holes are sections of video memory that are not displayed. Technically they exist in all video modes and in both Main and Auxilliary memory, but the term "screen holes" usually refers to those in Main TEXT page 1, which have special significance as discussed next.

2. What are screen holes used for?

Early Apple II's didn't always have 64k of RAM, and so low memory was special because it was always present. The 8 screen holes in TEXT page 1 must have seemed a natural fit for use by cards in the 8 expansion slots. The 1979 version of The Apple II Reference Manual has the following section reserving the screen hole locations for exclusive use by the system and expansion card firmware:

PERIPHERAL SLOT SCRATCHPAD RAM

Each of the eight peripheral slots has reserved for it 8 locations in ihe Apple's RAM memory. These 64 locations are actually in memory pages $04 through $07, inside the area reserved for the Text and Low-Resolution Graphics video display. The contents of these locations, however, are not displayed on the screen, and their contents are not changed by normal screen operations The peripheral cards can use these locations for temporary storage of data while the cards are in operation. These "scratchpad" locations have the following addresses:

```
Table 26: I/O Scratchpad RAM Addresses

Base  Slot Number
Addr  1     2     3     4     5     6     7
$0478 $0479 $047A $047B $047C $047D $047E $047F
$04F8 $04F9 $04FA $04FB $04FC $04FD $04FE $04FF
$0578 $0579 $057A $057B $057C $057D $057E $057F
$05F8 $05F9 $05FA $05FB $05FC $05FD $0SFE $05FF
$0678 $0679 $067A $067B $067C $067D $067E $067F
$06F8 $06F9 $06FA $06FB $06FC $06FD $06FE $06FF
$0778 $0779 $077A $077B $077C $077D $077E $077F
$07F8 $07F9 $07FA $07FB $07FC $07FD $07FE $07FF
Slot 0 does not have any scratchpad RAM addresses reserved for it. The Base Address locations are used by Apple DOS 3.2 and are also shared by all peripheral cards.

```

Both the Apple //c and the Apple IIgs firmware for built-in devices uses the screen holes. In addition the Apple //c uses several areas in Auxilliary memory including the Aux TEXT page 1 screen hole at $0478-$047F as documented in Table B-4 of The Apple IIc Technical Reference Manual.


## Usefull routines

```
 Hex   Dec
-------------------------------------------------------------------------------------------
$BEF8 48888  ProDOS- recovers from "NO BUFFERS AVAILABLE" error
$D683 54915  Inits Applesoft stack- scraps false "OUT OF MEMORY" error.
$F328 -3288  Repairs Applesoft stack after an ONERR GOTO handles an error.
$F3D4 -3116  HGR2
$F3DE -3106  HGR
$F3F2 -3086  Clear HI-RES screen to Black
$F3F6 -3082  Clear HI-RES screen to recent HCOLOR
$F5CB -2613  Move HI-RES cursor coords to 224-226
$F800 -2048  PLOT a LO-RES POINT (AC:Y-COORD  Y:X-COORD)
$F819 -2023  DRAW a HORIZONTAL LO-RES LINE.
$F828 -2008  DRAW a VERTICAL LO-RES LINE.
$F832 -1998  CLEAR LO-RES SCREEN 1 and set GRAPHICS mode.
$F836 -1994  CLEAR top 20 lines of LO-RES Graphics
$F847 -1977  CALCULATE LO-RES Graphics base ADDRESS.
$F85F -1953  Change LO-RES COLOR to COLOR + 3
$F940 -1728  PRINT contents of X & Y (REG 9 as 4 HEX digits)
$F94C -1716  PRINT X BLANKS (X REG contains # to PRINT)
$FA86 -1402  IRQ HANDLER
$FA92 -1390  BREAK HANDLER
$FAA6 -1370  RE-BOOTS DISK SYSTEM
$FAD7 -1321  to display USER REGISTERS
$FB2F -1233  TEXT- screen init
$FB39 -1223  set SCREEN to TEXT mode
$FB40 -1216  GR- set GRAPHICS mode
$FB4B -1205  set NORMAL WINDOW
$FB60 -1184  Prints the 'Apple ][' at the top of your screen.
$FBC1 -1087  CALCULATE TEXT BASE ADDRESS
$FBE4 -1052  SOUND BELL
$FBF4 -1036  to MOVE CURSOR RIGHT
$FBFD -1027  OUTPUT A-REG as ASCII on TEXT SCREEN 1
$FC10 -1008  to MOVE CURSOR LEFT
$FC1A  -998  to MOVE CURSOR UP
$FC22  -990  PERFORM a VERTICAL TAB to ROW in ACCUMULATOR
$FC2C  -980  PREFORM ESCAPE FUNCTION
$FC42  -958  CLEAR from CURSOR to END of PAGE (ESC -F)
$FC58  -936  HOME & CLEAR SCREEN (Destroys ACCUMULATOR & Y-REG)
$FC62  -926  PERFORM a CARRIAGE RETURN
$FC66  -922  PERFORM a LINE FEED
$FC70  -912  SCOLL UP 1 LINE (Destroys ACCUMULATOR & Y-REG)
$FC95  -875  Clear entire Text line.
$FC9C  -868  CLEAR from CURSOR to END of LINE (ESC-E)
$FDOC  -756  GET KEY from KEYBOARD (Destroys A & Y-REG) WAIT for KEY PRESS.
$FD5A  -678  Wait for RETURN
$FD5C  -676  Sound Bell and wait for RETURN
$FD67  -665  PREFORM CARRIAGE RETURN & GET LINE of TEXT.
$FD6A  -662  GET LINE of TEXT from KEYBOARD (X RETND with # of CHARACTERS)
$FD6F  -657  INPUT which accepts commas & colons. Here is an example:
             PRINT "NAME (LAST, FIRST): ";: CALL-657: N$="": FOR X= 512 TO 719:
             IF PEEK (X) < > 141 THEN N$= N$ + CHR$ (PEEK (X) -128) : NEXT X

$FD8E  -626  PRINT CARRIAGE RETURN (Destroys ACCUMULATOR & Y-REG)
$FDDA  -550  PRINT CONTENTS of ACCUMULATOR as 2 HEX DIGETS.
$FDE3  -541  PRINT a HEX digit
$FDED  -531  OUTPUT CHARACTER IN ACCUMULATOR. (Destroys A & Y-REG COUNT)
$FDF0  -528  GET MONITOR CHARACTER OUTPUT
$FE2C  -468  PERFORM MEMORY MOVE A1-A2 TO A4. Here is an example:
             10 POKE 60,Source Start address Lo
             20 POKE 61,Source Start address Hi
             30 POKE 62,Source End address Lo
             40 POKE 63,Source End address Hi
            50 POKE 66,Destination address Lo
           60 POKE 67,Destination address Hi
             70 CALL -468

$FE80  -384  set INVERSE mode
$FE84  -380  set NORMAL mode
$FEBF  -321  DISPLAY A,S,Y,P,S REG. (CURRENT VALUES)
$FF2D  -211  PRINT "ERR" & SOUNDS BELL (Destroys ACCUMULATOR & Y-REG)
$FF3A  -198  PRINT BELL (Destroys ACCUMULATOR & Y-REG)
$FF59  -167  ENTER MONITOR RESET, TEXT mode, "COLD START"
$FF65  -155  ENTER MONITOR, ring BELL, "WARM START"
$FF69  -151  Go to MONITOR
$FF70  -144  SCAN INPUT BUFFER (ADDRESS $200...)
```
