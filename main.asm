BasicUpstart2(init)


#import "constants.asm"
#import "includes.asm"

    * = $C000 "Main"    // SYS 49152

init:   lda #BLACK
        sta VIC_BORDER
        sta VIC_BACKGROUND

        // Set hires mode
        lda #%00111000
        ora VIC_CONTROL_1
        sta VIC_CONTROL_1
        lda #%00000011
        ora MEMORY_MAP
        sta MEMORY_MAP
        lda #%00011000
        sta MEMORY_CONTROL
        jsr clear
        rts

// Character (now colour) fast screen clear
clear:  lda #$20
        ldx #(1024/8)
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

// Clear hires screen
// TODO: #1 Fix this to include the last 320 bytes (i.e. the last row)
//         lda #$00
//         tax
// !loop:  sta $2000,x
//         sta $2000+($100*1),x
//         sta $2000+($100*2),x
//         sta $2000+($100*3),x
//         sta $2000+($100*4),x
//         sta $2000+($100*5),x
//         sta $2000+($100*6),x
//         sta $2000+($100*7),x
//         sta $2000+($100*8),x
//         sta $2000+($100*9),x
//         sta $2000+($100*10),x
//         sta $2000+($100*11),x
//         sta $2000+($100*12),x
//         sta $2000+($100*13),x
//         sta $2000+($100*14),x
//         sta $2000+($100*15),x
//         sta $2000+($100*16),x
//         sta $2000+($100*17),x
//         sta $2000+($100*18),x
//         sta $2000+($100*19),x
//         sta $2000+($100*20),x
//         sta $2000+($100*21),x
//         sta $2000+($100*22),x
//         sta $2000+($100*23),x
//         sta $2000+($100*24),x
//         sta $2000+($100*25),x
//         sta $2000+($100*26),x
//         sta $2000+($100*27),x
//         sta $2000+($100*28),x
//         sta $2000+($100*29),x
        
//         dex
//         bne !loop-
        rts
