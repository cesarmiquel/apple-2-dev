 *=$6000
 !to "HL.bin", plain	; set output file and format
 !cpu 6502		; set processor type

GBASL	=	$26
GBASH	=	$27
SETGR    =     $FB40 ; процедура установки режима
GBASCALC = $F847 ; рассчет вертикального адреса

CLRTEXT =  $C050 ;display graphics 
SETTEXT =  $C051 ;display text 

CLRMIXED = $C052 ;clear mixed mode- enable full graphics 
SETMIXED = $C053 ;enable graphics/text mixed mode 

PAGE1 =    $C054 ;select text/graphics page1 
PAGE2 =    $C055 ;select text/graphics page2 

CLRHIRES = $C056 ;select Lo-res 
SETHIRES = $C057 ;select Hi-res 

TMP= $FA

	JSR   SETGR      ;GR
	BIT CLRMIXED ; full screen


;zero
	lda #0
	tay
	ldx #$20
zm sta $6400,y
	iny
	bne zm
	inc zm+2
	dex
	bne zm

;gen LUT
	ldx #0
glut
	txa
;	and #$38
;	lsr
;	lsr
;	lsr
;	lsr
	and #$0F
	sta GBASL
	asl
	asl
	asl
	asl
	ora GBASL
	sta COLORS,x
	inx
	bne glut

ONEL
;RANDOM=$D20A
vmem = $6400 ;BC40
buff = $7000
var_e = $E0
adr_l = $E1
adr_h = $E2
var_c = $E3

 lda LA4A3
 sta var_e
; CALL LA53A;random
; lda RANDOM 
 jsr LA53A

 clc
 adc #04
 bcc LA573

; CALL LA53A;random
; lda RANDOM 
  jsr LA53A
 and #03
 tax
 lda vars,x
 sta var_e

LA573

 lda var_e
 sta LA4A3

 lda LA4A4
 and #$08
 bne LA585

 lda LA4A4
 and #$03
 bne LA598

LA585 ;CALL LA53A;random
;lda RANDOM ; LA585
 jsr LA53A
 tay
 lda #0
 sta adr_l

 ;lda RANDOM
   jsr LA53A
 and #1
 clc
 adc #buff/256
 sta adr_h
 lda (adr_l),y
 clc
 adc var_e
 eor (adr_l),y
 and #$0F ;38
 eor (adr_l),y
 sta (adr_l),y
;---------------------
LA598 ;  lda RANDOM 
 jsr LA53A
		AND #$FE

		php
		lda LA4A4
		plp
		bne LA5A4
		eor #$08
LA5A4
	clc
	adc #$01
	and #$0B
	sta LA4A4

 lda #buff/256
 sta adr1+2
 sta adr6+2

 lda #vmem/256
 sta adr2+2
 sta adr3+2
 lda #vmem/256 - 1

 sta adr4+2 ;?
 sta adr5+2


 lda #4
 sta var_c
check_lp2
 ldy #0

check_lp1
adr1 lda buff,y
 clc
 adc var_e
 and #$0F ;38

adr2 cmp vmem+1,y
 beq put

adr3 cmp vmem+40,y
 beq put
 
adr4 cmp vmem-40,y
 beq put

adr5 cmp vmem-1,y
 bne next

put
adr6 sta buff,y

next
 iny
 bne check_lp1

 inc adr1+2
 inc adr2+2
 inc adr3+2
 inc adr4+2
 inc adr5+2
 inc adr6+2

 dec var_c
 bne check_lp2

 ldy #0
copy
 lda buff,y
 sta vmem,y
 lda buff+256,y
 sta vmem+256,y
 lda buff+512,y
 sta vmem+512,y
 lda buff+768,y
 sta vmem+768,y
 iny
 bne copy


	lda #vmem&255
	sta cm2+1
	lda #vmem/256
	sta cm2+2

 ldx #0
cm1
	txa
	pha
	JSR GBASCALC
	ldy #0

cm2 LDX vmem,y
	lda COLORS,X
	STA(GBASL),Y
	INY
	CPY #40
	bne cm2
	pla
	tax
	lda cm2+1
	clc
	adc #40
	sta cm2+1
	bcc noh
	inc cm2+2
noh
	inx
	cpx #24
	bne cm1
 jmp ONEL

vars !byte 1,5,3,7 ; 8,$28,$18,$38
LA4A0   !byte 0
LA4A1   !byte 2
LA4A2   !byte 8
LA4A3   !byte $16
LA4A4   !byte 1


LA53A
;       LD A,(LA4A0),C,A,A,(LA4A1)

 lda LA4A0
 sta var_c
 lda LA4A1
;        LD (LA4A0),A:ADD A,C
 sta LA4A0
 clc
 adc var_c
;        LD C,A
 sta var_c
;        LD A,(LA4A2)
 lda LA4A2
;        LD(LA4A1),A
 sta LA4A1
;        ADD A,C
 clc
 adc var_c
;        RRCA!
 clc
 ror
 bcc skipy
 ora #$80
skipy
;        LD (LA4A2),A
 sta LA4A2
;        RET
 rts

COLORS 
;!byte $00,$11,$22,$33,$44,$55,$66,$77
;!byte $88,$99,$AA,$BB,$CC,$DD,$EE,$FF

