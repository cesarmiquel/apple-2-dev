# Messing with VBlank


Long thread to read about this:

http://www.megalextoria.com/forum2/index.php?t=msg&th=80388&goto=258166&


Another thread talking about how to write to the screen.

https://groups.google.com/forum/#!topic/comp.sys.apple2.programmer/sKxb-kkvdvo

Some interesting answers:

## Answer

...and the fastest loop to poll an arbitrary address:

LDA <address>
Bxx  <back to LDA>

is 7 cycles.

"Vapor lock" has been around for a long time, but it's difficult to
integrate with general code because of the difficulty of maintaining a
constant cycle count.


## Answer

  One of the trick you can use, from the Apple II+ to the Apple IIgs is to read the $C070.

  This byte is the value currently read by the video processor. If you want to be synchonized with the top of the screen (HGR 1), simply write known value at $2000 (begining of the HGR page) and loop over it.

  For example :

```
$2000 : BD BD BD BD BD BD BD BD BD BD BD BD BD BD BD BD
$2010 : BD BD BD BD BD BD BD BD BD BD BD BD BD BD BD BD

```

Waiting Routine :

```
    TOP_SCREEN  LDA  $C070
                CMP  $#BD
                BNE  TOOP_SCREEN
```

You need several pattern because the LDA / CMP /BNE takes few cycles and you can miss the BD. With sevral ones, you will catch it without any doubt.

Olivier

## Answer

> Has anyone determined what size of area can be drawn within a vertical
> blank period?

4550 cycles = 65 cycles * 70 lines, from:

http://rich12345.tripod.com/aiivideo/vbl.html

And, 4550 cycles is just the VBL period, you can get more cycles (17030
total) by "racing the beam" as others have mentioned -- and that's at 60
frames per second!

As, for how much screen area can be painted in 4550 cycles?

Coding for speed:

1137.5 bytes = 4550 / 4 cycle STA absolute instruction

That's painting more than the entire GR, GR2, TEXT or TEXT2 screen with the
same byte.  Or, you could paint over an eight of the hi-res screen with the
same byte.

I think an interesting thing to do would be to flip the graphics modes while
racing the beam:

https://www.youtube.com/watch?v=KD6ocf_0Bkw

## Answer

$C019 as the vertical blank status was added in the //e. (So the mouse card didn't need to muck with the screen on initialization as it did on the ][+.)

The //c works a little differently - it can do something useful: trigger an interrupt on VBL! (I would think that the IIGS can do this too; it's in the mouse firmware on the //c.)

To be clear: the challenge is to detect vertical blank on an original Apple ][, or Apple ][+.

Note that Bob Bishop's pre-//e article includes:

"...there seem to be very few Apple IIs in which the method can't be made to work when the incompatible peripherals are unplugged."

Pity he didn't list the cards. Additionally, my cryptic "not enough cycles to do this" should have been:

Waiting for vertical blank is generally used for things such as mouse cursors, where a relatively small graphic is redrawn on the same screen. A couple of things to consider are:

- Can the redraw be completed during the vertical blank?
- If vertical blank needs to be poll, can you afford the time to wait for vertical blank?

Page flipping is much easier to implement, though the RAM usage explodes.
