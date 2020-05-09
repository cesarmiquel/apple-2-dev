AC = java -jar /home/miquel/Develop/AppleII/tools/ac.jar
ACME = /usr/bin/acme

scroll: scroll.b vscroll.b scroll-multicolor.b

scroll.b: scroll.a
	echo "Compiling scroll"
	${ACME} -f plain -o scroll.b scroll.a
	${AC} -d bruno.dsk o
	${AC} -p bruno.dsk o B 0xa0 < scroll.b 

vscroll.b: vscroll.a
	echo "Compiling vscroll"
	${ACME} -f plain -o vscroll.b vscroll.a
	${AC} -d bruno.dsk a
	${AC} -p bruno.dsk a B 0xc00 < vscroll.b

scroll-multicolor.b: scroll-multicolor.a
	echo "Compiling scroll-multicolor"
	${ACME} -f plain -o scroll-multicolor.b scroll-multicolor.a
	${AC} -d bruno.dsk i
	${AC} -p bruno.dsk i B 0xc00 < scroll-multicolor.b


clean:
	echo "cleaning..."
	rm scroll.b vscroll.b

