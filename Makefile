CXX?=icpc
LOAD?=2
STORE?=1
SIZE?=100
EXTRA_FLAG?=""
OPT_LEVEL?=-O3

DEFINES=-DLOAD=$(LOAD) -DSTORE=$(STORE) -DSIZE=$(SIZE) $(EXTRA_FLAG) $(OPT_LEVEL)

ifeq ($(CXX), icpc)
	CFLAGS=$(DEFINES) -std=c++11 -qopenmp -xHOST -fno-alias -Iinclude
else
	ifneq (,$(findstring clang,$(CXX)))
		CFLAGS=$(DEFINES) -std=c++11 -fopenmp -Wno-write-strings -ftree-vectorize -mtune=native -Iinclude
	else
		CFLAGS=$(DEFINES) -std=c++11 -fopenmp -Wno-write-strings -ftree-vectorize -march=native -Iinclude
	endif
endif

all: bench.o dummy.o
		$(CXX) $(CFLAGS) bench.o dummy.o -o bench_exec

dummy.o: src/dummy.cpp
		$(CXX) $(CFLAGS) -c src/dummy.cpp -o dummy.o

bench.o: src/bench.cpp
		$(CXX) $(CFLAGS) -c src/bench.cpp -o bench.o

asm: src/bench.cpp
		$(CXX) $(CFLAGS) -S src/bench.cpp

from_asm: bench.s dummy.o
		$(CXX) $(CFLAGS) bench.s dummy.o -o bench_exec


clean: 
	rm *.o bench_exec
