# NTRG IBE WIN32 -- Makefile
# Patroklos Argyroudis <argp at domain cs.tcd.ie>
#
# Makefile for compilation of the Stanford IBE library on Win32.
#
# $Id: Makefile,v 1.2 2006/02/13 21:53:57 argp Exp $

CC = cl
LD = link
VCROOT = "c:\program files\microsoft visual studio .net 2003\vc7"
INCLUDE = -I$(VCROOT)/include -I$(VCROOT)/platformsdk/include \
	  -I"." -I"C:\openssl\include" -I"C:\gmp\include"
CFLAGS = -nologo -D_NTRG_WIN32_
LFLAGS = /incremental:no /nologo /subsystem:console /machine:X86 \
	    -libpath:"C:\gmp\lib" -libpath:"C:\openssl\lib" -libpath:"."
LIBS = ibe.lib gmp.lib libeay32.lib
LIBCMD = lib /nologo

SRCS =	byte_string.c \
	crypto.c \
	curve.c \
	format.c \
	fp2.c \
	ibe_lib.c
		
OBJS = $(SRCS:.c=.obj)

IBE_LIB = ibe.lib

.c.obj:
	$(CC) -c $(CFLAGS) $(INCLUDE) -Fo$@ $<

all:	$(IBE_LIB) ibetest

$(IBE_LIB):	$(OBJS)
		$(LIBCMD) /OUT:$(IBE_LIB) $(OBJS)

ibetest.obj:	ibetest.c
		$(CC) -c $(CFLAGS) $(INCLUDE) ibetest.c

ibetest:    ibetest.obj
	    $(LD) $(LFLAGS) -out:ibetest.exe ibetest.obj $(LIBS)

clean:
	del *.obj
	del $(IBE_LIB)
	del ibetest.exe

# EOF
