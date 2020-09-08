/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: EN
 * ***************************************************************************************************
 * 2 input exclusive NOR
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module EN(A,B,Z);

// I/O declaration
input A,B;
output Z;

//Describing operations using built-in-primitives
xnor(Z,A,B);

//Specifying delays
specify
specparam
BEST_RISE=0.29, BEST_FALL=0.39,
TYP_RISE=1.06, TYP_FALL=1.425,
WORST_RISE=1.83, WORST_FALL=2.46;
//Rise time and fall time in full connection  with Best, Typical and worst conditions
(A, B *> Z) = (BEST_RISE:TYP_RISE:WORST_RISE,BEST_FALL:TYP_FALL:WORST_FALL);
endspecify
endmodule
