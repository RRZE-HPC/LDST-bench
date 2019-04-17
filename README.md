# LDST-bench

Performance modelling and estimation constantly requires the bandwidth. 
However the bandwidth of the processors can vary depending on:
* Load store ratio
* Number of streams

LDST-bench allows:  to quantify all the combinations of loads and store streams

Usage : ./LDST-bench [METHOD] [COMPILER] [NTHREAD] [NUM_LOAD] [NUM_STORE] [SIZE_PER_THREAD(MB)] -v[OPTIONAL]
  * METHOD : what type of code, available options C, INTEL_ASM, ARM_ASM
  * COMPILER : specify the C++ compiler to use, supported and tested compilers icpc,g++,clang
  * NTHREAD : number of threads for benchmarking, currently only close (fill) pin is supported
  * NUM_LOAD : number of load streams
  * NUM_STORE : number of store streams
  * SIZE_PER_THREAD : Combined size of all streams per thread in MB
  * -v : Specify for verbose output
