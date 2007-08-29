CC=sdcc
CFLAGS=-I/usr/include -L/usr/lib
LDFLAGS=-mmcs51
BINDIR=~/bin
PROGS=hello_embedded_world

all: ${PROGS}

clean:
	rm -f ${PROGS} *.o *~

OBJECTS=hello.o
hello_embedded_world : ${OBJECTS}
	${CC} -o $@ ${OBJECTS} ${CFLAGS} ${LDFLAGS}

