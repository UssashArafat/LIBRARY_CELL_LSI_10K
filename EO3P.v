/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: EO3P
 * ***************************************************************************************************
 * 3 input exclusive OR
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module EO3P(A,B,C,Z);

// I/O declaration
input A,B,C;
output Z;

//Describing operations using built-in-primitives
xor (Z, A, B, C);

//Specifying delays
specify
specparam
BEST_RISE=0.61, BEST_FALL=0.71,
TYP_RISE=2.22, TYP_FALL=2.605,
WORST_RISE=3.83, WORST_FALL=4.50;
//Rise time and fall time in full connection  with Best, Typical and worst conditions
(A, B, C *> Z) = (BEST_RISE:TYP_RISE:WORST_RISE,BEST_FALL:TYP_FALL:WORST_FALL);
endspecify
endmodule
