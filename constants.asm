#importonce

// VIC_CONTROL_1 = F E D C B AAA
//
//           AAA = Vertical pixel scroll
//             B = 24 / 25 line (set = 25 line)
//             C = Screen visible (set = visible)
//             D = Bitmap / text (set = bitmap)
//             E = Extended colour mode (set = active)
//             F = MSB of raster position (LSB = $D012)
.const VIC_CONTROL_1    = $D011

.const VIC_RASTER       = $D012
.const VIC_CONTROL_2    = $D016
.const VIC_IRQ          = $D019
.const VIC_IRQEN        = $D01A
.const VIC_BORDER       = $D020
.const VIC_BACKGROUND   = $D021
.const MEMORY_CONTROL   = $D018
.const MEMORY_MAP       = $DD00