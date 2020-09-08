/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: IVP
 * ***************************************************************************************************
 * Inverter
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module IVP(A,Z);

// I/O declaration
input A;
output Z;

//Describing operations using built-in-primitives
not(Z,A);

//Specifying delays
specify
specparam
BEST_RISE=0.13, BEST_FALL=0.06,
TYP_RISE=0.485, TYP_FALL=0.215,
WORST_RISE=0.84, WORST_FALL=0.37;
//Rise time and fall time in full connection  with Best, Typical and worst conditions
(A *> Z) = (BEST_RISE:TYP_RISE:WORST_RISE,BEST_FALL:TYP_FALL:WORST_FALL);
endspecify
endmodule
