CC=g++
CFLAGS=-I/usr/include -L/usr/lib
LDFLAGS=
BINDIR=~/bin
PROGS=bitwise_operators

all: ${PROGS}

clean:
	rm -f ${PROGS} *.o *~

OBJECTS=bitwise_operators.o
bitwise_operators : ${OBJECTS}
	${CC} -o $@ ${OBJECTS} ${CFLAGS} ${LDFLAGS}

