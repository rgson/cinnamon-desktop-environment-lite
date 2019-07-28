#!/usr/bin/make -f

.PHONY: deb
deb: control
	equivs-build $^

control: control.orig control.tpl
	./gen-control.pl $^ >$@

.PHONY: control.orig  # Depends on files in apt's cache
control.orig:
	apt-cache show cinnamon-desktop-environment >$@

.PHONY: clean
clean:
	rm -f control control.orig cinnamon-desktop-environment-lite_*.deb
