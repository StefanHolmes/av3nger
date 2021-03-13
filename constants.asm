#importonce

// ============================================================================
.const VIC_SPR0_X       = $D000
.const VIC_SPR0_Y       = $D001
.const VIC_SPR1_X       = $D002
.const VIC_SPR1_Y       = $D003
.const VIC_SPR2_X       = $D004
.const VIC_SPR2_Y       = $D005
.const VIC_SPR3_X       = $D006
.const VIC_SPR3_Y       = $D007
.const VIC_SPR4_X       = $D008
.const VIC_SPR4_Y       = $D009
.const VIC_SPR5_X       = $D00A
.const VIC_SPR5_Y       = $D00B
.const VIC_SPR6_X       = $D00C
.const VIC_SPR6_Y       = $D00D
.const VIC_SPR7_X       = $D00E
.const VIC_SPR7_Y       = $D00F
.const VIC_SPR_X_MSB    = $D010
//
// Sprite positioning
//
// ============================================================================



// ============================================================================
.const VIC_CONTROL_1    = $D011
//
// %7_______ MSB of raster position (LSB = $D012)
// %_6______ Extended colour mode (1 = active, 0 = not active)
// %__5_____ Bitmap / text (1 = bitmap, 0 = character mode)
// %___4____ Screen visible (1 = visible, 0 = blank)
// %____3___ 24 / 25 rows (1 = 25 rows, 0 = 24 rows)
// %_____210 Vertical pixel scroll
//
// ============================================================================



// ============================================================================
.const VIC_RASTER       = $D012
//
//  Read: Lower 8 bits of current raster position
// Write: Set interrupt to fire on raster position
//
// ============================================================================



// ============================================================================
.const VIC_SPR_ENABLE   = $D015
//
// Each bit enables/disables specific sprite
//
// ============================================================================



// ============================================================================
.const VIC_CONTROL_2    = $D016
//
// %765_____ Always 110
// %___4____ Multicolour mode (1 = active, 0 = not active)
// %____3___ 38 / 40 column (1 = 40 columns, 0 = 38 columns)
// %_____210 Horizontal pixel scroll
//
// ============================================================================



// ============================================================================
.const VIC_SPR_Y_EXPAND = $D017
//
// Each bit enables/disables double height sprite
//
// ============================================================================



// ============================================================================
.const MEMORY_CONTROL   = $D018
//
// Screen in character mode: -
//
// %7654____ * 1024 + Current VIC bank = Location of screen character RAM
// %____321_ * 2048 + Current VIC bank = Start address of character set
// %_______0 Not used (always 1)
//
// ----------------------------------------------------------------------------
//
// Screen in bitmapped mode: -
//
// %7654____ * 1024 + Current VIC bank = Location of colour RAM
// %____3___ * 8192 + Current VIC bank = Start address of bitmap
// %_____210 Not used
//
//==============================================================================



//==============================================================================
.const VIC_IRQ          = $D019
//
// Read: -
//
// %7_______ One or more interrupt events have occurred and have not been ack'd
// %_654____ Not used
// %____3___ Light pen signal arrived
// %_____2__ Sprite/sprite collision
// %______1_ Sprite/background collision
// %_______0 Current raster line = raster line to generate interrupt at
// 
// ----------------------------------------------------------------------------
//
// Write: -
//
// %7654____ Not used
// %____3___ Ack light pen interrupt
// %_____2__ Ack sprite/sprite collision interrupt
// %______1_ Ack sprite/background collision interrupt
// %_______0 Ack raster interrupt
//
//==============================================================================



//==============================================================================
.const VIC_IRQ_EN       = $D01A
//
// %7654____ Not used
// %____3___ Light pen interrupt enabled
// %_____2__ Sprite/sprite collision interrupt enabled
// %______1_ Sprite/backgroun collision interrupt enabled
// %_______0 Raster interrupt enabled
//
//==============================================================================



// ============================================================================
.const VIC_SPR_PRIORITY = $D01B
//
// 0 = Corresponding sprite drawn in front of screen contents
// 1 = Corresponding sprite drawn behind screen contents
//
// ============================================================================



// ============================================================================
.const VIC_SPR_MULTI    = $D01C
//
// 0 = Corresponding sprite is single colour
// 1 = Corresponding sprite is multi-colour
//
// ============================================================================



// ============================================================================
.const VIC_SPR_X_EXPAND = $D01D
//
// Each bit enables/disables double width sprite
//
// ============================================================================



// ============================================================================
.const VIC_BORDER       = $D020
.const VIC_BACKGROUND   = $D021
//
// %7654____ Always 1111
// %____3210 Colour
//
// ============================================================================



// ============================================================================
.const MEMORY_MAP       = $DD00
//
// %765432__ Port A, serial bus access control bits
// %______10 VIC bank location. 11=$000 | 10=$4000 | 01=$8000 | 00=$C000
// 
// ============================================================================