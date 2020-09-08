/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: AO1
 * ***************************************************************************************************
 * 4 input AND-NOR
 * ***************************************************************************************************/

`timescale 1ns/1ps //Time unit and Time precision

module AO1 (A, B, C, D, Z);

//I/O ports
input A, B, C, D;
output Z;

wire TMP; //Internal signal

//Describing operation using built-in primitives
and (TMP, A, B);
nor (Z, TMP, C, D);

//Specifying Delays
specify
specparam
BEST_RISE=0.41, BEST_FALL=0.10,
TYP_RISE=1.495, TYP_FALL=0.365,
WORST_RISE=2.58, WORST_FALL=0.63;
//Rise time and fall time in full connection with Best, Typical and worst conditions
(A, B, C, D *> Z) = (BEST_RISE:TYP_RISE:WORST_RISE, BEST_FALL:TYP_FALL:WORST_FALL);
endspecify
endmodule
