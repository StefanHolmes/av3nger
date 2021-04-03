BasicUpstart2(init)

#import "global-constants.asm"
#import "av3nger-constants.asm"

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

!loop:
.for(var i=$100*30;-1<i;i=i-$100) {
        sta AV3_SCREEN+i,x
}
        dex
        bne !loop-

        // Now clear the remaining 64 bytes
        ldx #15
!loop:  sta AV3_SCREEN+$1f00,x
        sta AV3_SCREEN+$1f0f,x
        sta AV3_SCREEN+$1f1f,x
        sta AV3_SCREEN+$1f2f,x
        dex
        bne !loop-
        
// TODO: #3 This isn't part of the attract mode. Move it to be called when player starts
drawBottomLine:
        lda #$ff

        .for(var i=$d8;-1<i;i=i-8) {
        sta AV3_SCREEN+$1e07+i,x
        }

        cli     // Turn interrupts back on
        rts


// drawScoreAdvanceTable:
//         lda score_advance_table



#import "graphics.asm"

#import "text.asm"