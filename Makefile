PROG=bats
VERSION=0.4.0
ITERATION=2
RPM=$(PROG)-$(VERSION)-$(ITERATION).noarch.rpm
DESTDIR?=tmp/rootfs

$(RPM):
	mkdir -p $(DESTDIR)/usr/local/{bin,libexec,man}
	./install.sh $(DESTDIR)/usr/local
	fpm -s dir -t rpm -n $(PROG) -v $(VERSION) --iteration $(ITERATION) -a noarch \
		--url 'https://github.com/sstephenson/bats' -C $(DESTDIR) usr
	rm -rf $(DESTDIR)

clean:
	rm -f $(RPM)
