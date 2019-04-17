# LDST-bench

Performance modelling and estimation constantly requires the bandwidth. 
However the bandwidth of the processors can vary depending on:
* Load, store ratio
* Number of streams

LDST-bench allows to quantify all the combinations of loads and store streams

# Usage 

./LDST-bench [METHOD] [COMPILER] [NTHREADS] [NLOADS] [NSTORES] [SIZE_PER_THREAD(MB)] -c [LIKWID pinning string, OPTIONAL] -v[OPTIONAL]
  * METHOD : what type of code, available options: C, INTEL_ASM:SCALAR, INTEL_ASM:SSE, INTEL_ASM:AVX, INTEL_ASM:AVX512, ARM_ASM:NEON
  * COMPILER : specify the C++ compiler to use, supported and tested compilers icpc,g++,clang
  * NTHREADS : number of threads for benchmarking, currently only close (fill) pin is supported
  * NLOADS : number of load streams
  * NSTORES : number of store streams
  * SIZE_PER_THREAD : Combined size of all streams per thread in MB
  * -c : Pinning string for LIKWID, if using LIKWID for pinning (recommended)
  * -v : Specify for verbose output

# Examples 
For C method, g++ compiler, 10 threads, and 100 MB per thread
 * Copy : ./LDST-bench C g++ 10 1 1 100
 * Load : ./LDST-bench C g++ 10 1 0 100
 * Copy with 19 streams (like LBM codes) : ./LDST-bench C g++ 10 19 19 100 -v
 

# Showcase
 <p align="center">
  <img width="320" height="400" src="test_scripts/scaling_plot_skx.png">
  <img width="480" height="400" src="test_scripts/matrix_skx.png">
</p>

