AC = java -jar /home/miquel/Develop/AppleII/tools/ac.jar
ACME = /usr/bin/acme

scroll: scroll.b

scroll.b: scroll.a
	echo "Compiling scroll"
	${ACME} -f plain -o scroll.b scroll.a
	${AC} -d bruno.dsk o
	${AC} -p bruno.dsk o B 0xc00 < scroll.b

clean:
	echo "cleaning..."
	rm scroll.b

