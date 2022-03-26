targets: main.asm
	java -jar ~/KickAss/KickAss.jar main.asm
	mv main.prg av3nger.prg

clean:
	rm -f *.prg *.dbg
