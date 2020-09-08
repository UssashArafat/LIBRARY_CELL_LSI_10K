/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: AO6P
 * ***************************************************************************************************
 * 3 input AND-NOR
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module AO6P(A,B,C,Z);

// I/O declaration
input A,B,C;
output Z;

//Internal signals
wire TMP;

//Describing operations using built-in-primitives
and (TMP,A,B);
nor (Z,TMP,C);

//Specifying delays
specify
specparam
BEST_RISE=0.29, BEST_FALL=0.07,
TYP_RISE=1.075, TYP_FALL=0.245,
WORST_RISE=1.86, WORST_FALL=0.42;
//Rise time and fall time in full connection  with Best, Typical and worst conditions
(A, B, C *> Z) = (BEST_RISE:TYP_RISE:WORST_RISE,BEST_FALL:TYP_FALL:WORST_FALL);
endspecify
endmodule
