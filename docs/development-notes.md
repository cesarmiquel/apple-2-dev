# Development notes


## Using the monitor


Some common commands:

`C00.C07` - Display bytes from `$C00 - $C07`
`D00<C00.C07M` - Copy bytes from `$C00-$C07` onto `$D00`
`C00:B1 B2` - Store `$B1` onto `$C00` and `$B2` onto `$C01`

`2000:0` and then `2001<2000.3FFFM` - 'hack' to set to 0 `$2000 - $3FFF`.


## Applewin

- Page with keybindigs for AppleWin debugger [[web]](http://web.mit.edu/nelhage/Public/otrail/applewin/Intro_To_New_Debugger.htm)


Some useful commands:

`m1 [address]` View mini-memory 1 in Hex at the Address
`m2 [address]` View mini-memory 2 in Hex at the Address
`ma1 [address]` View mini-memory 1 in Text at the Address
`ma2 [address]` View mini-memory 2 in Text at the Address
