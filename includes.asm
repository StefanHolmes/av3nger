.var font = LoadBinary("assets\font_44x8.bin")
.var enemies = LoadBinary("assets\sprites_48x8.bin")

* = $2000 "Font graphics"
fontData: .fill font.getSize(), font.get(i)

* = $2160 "Enemy graphics"
enemyData: .fill enemies.getSize(), enemies.get(i)