/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: FT2P
 * ***************************************************************************************************
 * T flip-flop with clear
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module FT2P(CP, CD, Q, QN);
// I/O ports
input CP, CD;
output Q, QN;

//Describing operations using built-in-primitives and UDP
UDP_FT2P (Q, CP, CD); 
not (QN, Q);

//Specifying delays
specify
specparam
TLH_Q=0.42:1.545:2.67, THL_Q=0.38:1.385:2.39, //Rise time and fall time in min:typ:max
TLH_QN=0.54:1.965:3.39, THL_QN=0.64:2.34:4.04;

(CP *> Q) = (TLH_Q,THL_Q);
(CP *> QN) = (TLH_QN,THL_QN);

endspecify
endmodule
