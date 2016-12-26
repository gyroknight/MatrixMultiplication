CC = g++
CFLAGS = -g -Wall
OCL_LIB = -L /usr/lib/ -lOpenCL
OCL_INC = -I /opt/AMDAPP/include
MT_DEPS = eventlist.cpp

all : MM

MM : MM.cpp 
	$(CC) $(CFLAGS) -o $@ $< $(MT_DEPS) $(OCL_INC) $(OCL_LIB)
	
clean :
	rm -rf MM
