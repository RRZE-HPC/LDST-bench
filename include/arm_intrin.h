#ifndef ARM_INTRIN_H
#define ARM_INTRIN_H

#ifdef CODE_IN_ARM_ASM
#include <arm_neon.h>

#if defined(NEON)
    #define VAR float64x2_t
    #define ASM(op) v ## op ## q_f64
    #define ASM_UNROLL 2
    #define ASM_NAME "NEON:A64"
#endif

#endif

#endif
