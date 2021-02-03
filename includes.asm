.var font = LoadBinary("font_44x8.bin")

* = $2000 "Font graphics"
fontData: .fill font.getSize(), font.get(i)