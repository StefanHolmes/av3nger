BasicUpstart2(init)

#import "global-constants.asm"
#import "av3nger-constants.asm"

        * = * "Main"

init:   lda #BLACK
        sta VIC_BORDER
        sta VIC_BACKGROUND

        //=====================================================================
        // Hires screen @ $2000 (8192)
        //
        //   %______10 VIC bank location. 11=$0000 | 10=$4000 | 01=$8000 | 00=$C000
        lda #%00000011
        sta MEMORY_MAP
        //
        //   %7654____ * 1024 + Current VIC bank = Location of colour RAM
        //   %____3___ * 8192 + Current VIC bank = Start address of bitmap
        //   %_____210 Not used
        lda #%00011000
        sta MEMORY_CONTROL
        //=====================================================================

        // Set hires mode
        //   %__5_____ Bitmap / text (1 = bitmap, 0 = character mode)
        //   %___4____ Screen visible (1 = visible, 0 = blank)
        //   %____3___ 24 / 25 rows (1 = 25 rows, 0 = 24 rows)
        lda #%00111000
        sta VIC_CONTROL_1

        // Fast charmode screen clear
        lda #(BLACK+16*WHITE)
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

        // --------------------------------------------------------------------
        // Create lookup tables for text rendering
        //
        // Inspiration from https://codebase64.org/doku.php?id=base:dots_and_plots
        //
        // Create a table of memory locations to use as character position lookups
        // into the bitmapped display. Position resolution = 8x8, so the table will
        // be small enough to fit into the same bank as the display.

        lda #0
        tax
        sta $00fb       // Normally unused zero-page addresses
        sta $00fc

build_x_table:
        clc
        lda $00fb
        adc #08
        sta $00fb
        bcc add16_done
        inc $00fc

add16_done:
        lda $00fb
        sta AV3_SCREEN+8001,x
        lda $00fc
        sta AV3_SCREEN+8000,x
        inx
        inx
        cpx #78
        bne build_x_table

         // --------------------------------------- End of lookup table creation
        // Only runs once

        
// TODO: #3 This isn't part of the attract mode. Move it to be called when player starts
drawBottomLine:
        lda #$ff
        ldx #0

        .for(var i=$d8;-1<i;i=i-8) {
        sta AV3_SCREEN+$1e07+i,x
        }
// ---

        cli     // Turn interrupts back on
        rts


// drawScoreAdvanceTable:
//         lda score_advance_table

#import "graphics.asm"
#import "text.asm"