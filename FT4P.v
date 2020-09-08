/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: FT4P
 * ***************************************************************************************************
 * T flip-flop with preset
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module FT4P(CP, SD, Q, QN);
// I/O ports
input CP, SD;
output Q, QN;

//Describing operations using built-in-primitives and UDP
UDP_FT4P (Q, CP, SD); 
not (QN, Q);

//Specifying delays
specify
specparam
TLH_Q=0.38:1.4:2.42, THL_Q=0.38:1.385:2.39, //Rise time and fall time in min:typ:max
TLH_QN=0.60:2.205:3.81, THL_QN=0.60:2.205:3.81;

(CP *> Q) = (TLH_Q,THL_Q);
(CP *> QN) = (TLH_QN,THL_QN);

endspecify
endmodule
