exec = yale
dest = /usr/local/bin

install:
	install -m 0755 $(exec) $(dest)

link:
	ln -s $(realpath $(exec)) $(dest)

uninstall:
	rm $(dest)/$(exec)
