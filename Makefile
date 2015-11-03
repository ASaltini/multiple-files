CC = gcc
CXX = g++
RM = rm -f
CPPFLAGS = -O3 -Wall -std=c++14
LDFLAGS = -O3 -Wall -std=c++14
LDLIBS =

MAIN = multiple.cpp
SRCS = $(MAIN) add.cpp
OBJS = $(subst .cpp,.o,$(SRCS))

.PHONY: all clean dist-clean

all: main

main: $(OBJS)
	    $(CXX) $(LDFLAGS) -o $(subst .cpp,,$(MAIN)) $(OBJS) $(LDLIBS)

depend: .depend

.depend: $(SRCS)
	    $(RM) ./.depend
	    $(CXX) $(CPPFLAGS) -MM $^ >> ./.depend;

clean:
	    $(RM) $(OBJS)

dist-clean: clean
	    $(RM) *~ .depend

include .depend
