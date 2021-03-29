CC=gcc
CFLAGS=-O2 -Wall

LIBS=-lX11
OBJ=main.o xeb_handler.o

PREFIX=/usr/local

.PHONY: all clean
all: xeventbind

xeventbind: $(OBJ)
	$(CC) -o $@ $^ $(LIBS) $(CFLAGS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

install: xeventbind
	install -m 755 $< $(PREFIX)/bin

uninstall:
	rm $(PREFIX)/bin/xeventbind

clean:
	rm -f xeventbind *.o
