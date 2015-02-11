#
# nsock regression test suite
# Same license as nmap -- see http://nmap.org/book/man-legal.html
##

NBASEDIR=/home/auresearch/shane/poodle/nmap-6.47/nbase
NSOCKLIB=../src/libnsock.a
NBASELIB=$(NBASEDIR)/libnbase.a

CC 	= gcc
CFLAGS	= -Wall -O0 -I../include -I$(NBASEDIR)
LDFLAGS	= -L/home/auresearch/shane/poodle/nmap-6.47/libpcap  -L/home/auresearch/shane/poodle/nmap-6.47/nbase
LIBS	= -lssl -lcrypto /home/auresearch/shane/poodle/nmap-6.47/libpcap/libpcap.a

SRC = tests_main.c \
      basic.c \
      timer.c \
      logs.c \
      connect.c \
      ghlists.c \
      ghheaps.c \
      cancel.c

OBJ = $(SRC:.c=.o)

EXE = tests_main

all: $(SRC) $(EXE)

$(EXE): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@ $(NSOCKLIB) $(NBASELIB) $(LIBS)

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) $(OBJ) $(EXE)

rebuild: clean $(EXE)

.PHONY: clean rebuild
