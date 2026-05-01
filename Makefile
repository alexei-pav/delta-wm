# deltawm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c deltawm.c util.c
OBJ = ${SRC:.c=.o}

# FreeBSD users, prefix all ifdef, else and endif statements with a . for this to work (e.g. .ifdef)

ifdef YAJLLIBS
all: deltawm deltawm-msg
else
all: deltawm
endif

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

deltawm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

ifdef YAJLLIBS
deltawm-msg:
	${CC} -o $@ patch/ipc/deltawm-msg.c ${LDFLAGS}
endif

clean:
	rm -f deltawm ${OBJ} deltawm-${VERSION}.tar.gz
	rm -f deltawm-msg

dist: clean
	mkdir -p deltawm-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		deltawm.1 drw.h util.h ${SRC} deltawm.png transient.c deltawm-${VERSION}
	tar -cf deltawm-${VERSION}.tar deltawm-${VERSION}
	gzip deltawm-${VERSION}.tar
	rm -rf deltawm-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f deltawm ${DESTDIR}${PREFIX}/bin
ifdef YAJLLIBS
	cp -f deltawm-msg ${DESTDIR}${PREFIX}/bin
endif
	chmod 755 ${DESTDIR}${PREFIX}/bin/deltawm
ifdef YAJLLIBS
	chmod 755 ${DESTDIR}${PREFIX}/bin/deltawm-msg
endif
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < deltawm.1 > ${DESTDIR}${MANPREFIX}/man1/deltawm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/deltawm.1
	mkdir -p ${DESTDIR}${PREFIX}/share/xsessions
	test -f ${DESTDIR}${PREFIX}/share/xsessions/deltawm.desktop || cp -n deltawm.desktop ${DESTDIR}${PREFIX}/share/xsessions
	chmod 644 ${DESTDIR}${PREFIX}/share/xsessions/deltawm.desktop

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/deltawm\
		${DESTDIR}${MANPREFIX}/man1/deltawm.1\
		${DESTDIR}${PREFIX}/share/xsessions/deltawm.desktop

.PHONY: all clean dist install uninstall
