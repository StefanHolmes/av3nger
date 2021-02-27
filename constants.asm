#importonce

//==============================================================================
.const VIC_CONTROL_1    = $D011
//
// %7_______ MSB of raster position (LSB = $D012)
// %_6______ Extended colour mode (1 = active, 0 = not active)
// %__5_____ Bitmap / text (1 = bitmap, 0 = character mode)
// %___4____ Screen visible (1 = visible, 0 = blank)
// %____3___ 24 / 25 rows (1 = 25 rows, 0 = 24 rows)
// %_____210 Vertical pixel scroll
//
//==============================================================================



//==============================================================================
.const VIC_RASTER       = $D012
//
//  Read: Lower 8 bits of current raster position
// Write: Set interrupt to fire on raster position
//
//==============================================================================



//==============================================================================
.const VIC_SPRITES      = $D015
//
// Each bit enables/disables specific sprite
//
//==============================================================================



//==============================================================================
.const VIC_CONTROL_2    = $D016
//
// %765_____ Always 110
// %___4____ Multicolour mode (1 = active, 0 = not active)
// %____3___ 38 / 40 column (1 = 40 columns, 0 = 38 columns)
// %_____210 Horizontal pixel scroll
//
//==============================================================================

.const MEMORY_CONTROL   = $D018
.const VIC_IRQ          = $D019
.const VIC_IRQEN        = $D01A
.const VIC_BORDER       = $D020
.const VIC_BACKGROUND   = $D021
.const MEMORY_MAP       = $DD00