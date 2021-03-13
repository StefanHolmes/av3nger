BasicUpstart2(init)

#import "constants.asm"

        * = * "Main"

init:   lda #BLACK
        sta VIC_BORDER
        sta VIC_BACKGROUND

        // Set hires mode
        lda #%00111000
        sta VIC_CONTROL_1

        // Hires screen @ $2000 (8192)
        lda #%10010011
        sta MEMORY_MAP
        lda #%00011000
        sta MEMORY_CONTROL

        // Character (now colour) fast screen clear
        // TODO: #2 This needs to be changed to add tint zones
fullclear:
        lda #(BLACK+16*GREEN)
        ldx #(1000/8)
!loop:  sta $03ff,x
        sta $047c,x
        sta $04f9,x
        sta $0576,x
        sta $05f3,x
        sta $0670,x
        sta $06ed,x
        sta $076a,x
        dex
        bne !loop-

        // Clear hires screen. Looks like it takes ~4 frames.
        txa     // X register is zero because of the previous loop.
        sei     // Turn off interrupts

!loop:  sta $2000,x
        sta $2000+($100*1),x
        sta $2000+($100*2),x
        sta $2000+($100*3),x
        sta $2000+($100*4),x
        sta $2000+($100*5),x
        sta $2000+($100*6),x
        sta $2000+($100*7),x
        sta $2000+($100*8),x
        sta $2000+($100*9),x
        sta $2000+($100*10),x
        sta $2000+($100*11),x
        sta $2000+($100*12),x
        sta $2000+($100*13),x
        sta $2000+($100*14),x
        sta $2000+($100*15),x
        sta $2000+($100*16),x
        sta $2000+($100*17),x
        sta $2000+($100*18),x
        sta $2000+($100*19),x
        sta $2000+($100*20),x
        sta $2000+($100*21),x
        sta $2000+($100*22),x
        sta $2000+($100*23),x
        sta $2000+($100*24),x
        sta $2000+($100*25),x
        sta $2000+($100*26),x
        sta $2000+($100*27),x
        sta $2000+($100*28),x
        sta $2000+($100*29),x
        sta $2000+($100*30),x
        
        dex
        bne !loop-

        // Now clear the remaining 64 bytes
        ldx #15
!loop:  sta $3f00,x
        sta $3f0f,x
        sta $3f1f,x
        sta $3f2f,x
        dex
        bne !loop-
        
// TODO: #3 This isn't part of the attract mode. Move it to be called when player starts
drawBottomLine:
        lda #$ff
        sta $3e07,x
        sta $3e07+$08,x
        sta $3e07+$10,x
        sta $3e07+$18,x
        sta $3e07+$20,x
        sta $3e07+$28,x
        sta $3e07+$30,x
        sta $3e07+$38,x
        sta $3e07+$40,x
        sta $3e07+$48,x
        sta $3e07+$50,x
        sta $3e07+$58,x
        sta $3e07+$60,x
        sta $3e07+$68,x
        sta $3e07+$70,x
        sta $3e07+$78,x
        sta $3e07+$80,x
        sta $3e07+$88,x
        sta $3e07+$90,x
        sta $3e07+$98,x
        sta $3e07+$a0,x
        sta $3e07+$a8,x
        sta $3e07+$b0,x
        sta $3e07+$b8,x
        sta $3e07+$c0,x
        sta $3e07+$c8,x
        sta $3e07+$d0,x
        sta $3e07+$d8,x
                
        cli     // Turn interrupts back on
        rts

#import "graphics.asm"

text:
#import "text.asm"