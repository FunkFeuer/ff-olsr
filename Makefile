# To use this Makefile, get a copy of my SF Release Tools
# git clone git://git.code.sf.net/p/sfreleasetools/code sfreleasetools
# And point the environment variable RELEASETOOLS to the checkout
ifeq (,${RELEASETOOLS})
    RELEASETOOLS=../releasetools
endif
OLSR=ff_olsr
LASTRELEASE:=$(shell $(RELEASETOOLS)/lastrelease -n)
VERSIONPY=$(OLSR)/Version.py
VERSION=$(VERSIONPY)
README=README.rst
SRC=Makefile setup.py MANIFEST.in $(README) $(FILES:%.py=$(OLSR)/%.py)
FILES= common.py __init__.py parser.py

all: $(VERSION)

$(VERSION): $(SRC)

dist: all
	python setup.py sdist --formats=gztar,zip

clean:
	rm -f MANIFEST $(OLSR)/Version.py README.html README.aux \
	    README.dvi README.log README.out README.tex
	rm -rf dist build upload ReleaseNotes.txt

include $(RELEASETOOLS)/Makefile-sf
