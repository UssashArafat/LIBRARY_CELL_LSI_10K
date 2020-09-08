/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: IV
 * ***************************************************************************************************
 * Inverter
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module IV(A,Z);

// I/O declaration
input A;
output Z;

//Describing operations using built-in-primitives
not(Z,A);

//Specifying delays
specify
specparam
BEST_RISE=0.14, BEST_FALL=0.06,
TYP_RISE=0.51, TYP_FALL=0.205,
WORST_RISE=0.88, WORST_FALL=0.35;
//Rise time and fall time in full connection  with Best, Typical and worst conditions
(A *> Z) = (BEST_RISE:TYP_RISE:WORST_RISE,BEST_FALL:TYP_FALL:WORST_FALL);
endspecify
endmodule
