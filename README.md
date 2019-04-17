# LDST-bench

Performance modelling and estimation constantly requires the bandwidth. 
However the bandwidth of the processors can vary depending on:
* Load store ratio
* Number of streams

LDST-bench allows:  to quantify all the combinations of loads and store streams

Usage : ./LDST-bench [METHOD] [COMPILER] [NTHREAD] [NUM_LOAD] [NUM_STORE] [SIZE_PER_THREAD(MB)] -v[OPTIONAL]
