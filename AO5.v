/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: AO5
 * ***************************************************************************************************
 * 3 input AND-NOR
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module AO5(A,B,C,Z);

// I/O declaration
input A,B,C;
output Z;

//Internal signals
wire TMP0,TMP1,TMP2;

//Describing operations using built-in-primitives
and (TMP0,A,B);
and (TMP1,A,C);
and (TMP2,B,C);
nor (Z, TMP0,TMP1,TMP2);

//Specifying delays
specify
specparam
BEST_RISE=0.41, BEST_FALL=0.17,
TYP_RISE=1.505, TYP_FALL=0.605,
WORST_RISE=2.60, WORST_FALL=1.04;
//Rise time and fall time in full connection  with Best, Typical and worst conditions
(A, B, C *> Z) = (BEST_RISE:TYP_RISE:WORST_RISE,BEST_FALL:TYP_FALL:WORST_FALL);
endspecify
endmodule
