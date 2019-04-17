#ifndef INTEL_INTRIN_H
#define INTEL_INTRIN_H

#ifdef CODE_IN_INTEL_ASM
#include <immintrin.h>

#if defined(AVX512)
    #define VAR __m512d
    #define ASM(op) _mm512_ ## op ## _pd
    #define ASM_UNROLL 8
    #define ASM_NAME "AVX512"
#elif defined(AVX)
    #define VAR __m256d
    #define ASM(op) _mm256_ ## op ## _pd
    #define ASM_UNROLL 4
    #define ASM_NAME "AVX"
#elif defined(SSE)
    #define VAR __m128d
    #define ASM(op) _mm_ ## op ## _pd
    #define ASM_UNROLL 2
    #define ASM_NAME "SSE"
#elif defined(SCALAR)
    #define VAR __m128d
    #define ASM(op) _mm_ ## op ## _sd
    #define ASM_UNROLL 1
    #define ASM_NAME "SCALAR"
    #define _mm_loadu_sd _mm_load_pd
    #define _mm_storeu_sd _mm_store_pd
#endif

#endif

#endif
