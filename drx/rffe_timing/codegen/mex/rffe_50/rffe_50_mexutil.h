/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * rffe_50_mexutil.h
 *
 * Code generation for function 'rffe_50_mexutil'
 *
 */

#ifndef __RFFE_50_MEXUTIL_H__
#define __RFFE_50_MEXUTIL_H__

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "blas.h"
#include "rtwtypes.h"
#include "omp.h"
#include "rffe_50_types.h"

/* Function Declarations */
extern emlrtCTX emlrtGetRootTLSGlobal(void);
extern void emlrtLockerFunction(EmlrtLockeeFunction aLockee, const emlrtConstCTX
  aTLS, void *aData);

#endif

/* End of code generation (rffe_50_mexutil.h) */
