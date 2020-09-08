/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: FD3
 * ***************************************************************************************************
 * D flip-flop with clear and preset
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

module FD3(D, CP, CD, SD, Q, QN);
// I/O ports
input D, CP, CD, SD;
output Q, QN;
reg NOTIFIER;

//Describing operations using built-in-primitives and UDP
UDP_FD3 (Q, CP, CD, SD, D, NOTIFIER); 
not (QN, Q);

//Specifying delays
specify
specparam
TSU=0.90, TH=0.36, //Setup time and hold time
TLH_Q=0.43:1.575:2.72, THL_Q=0.50:1.815:3.13, //Rise time and fall time in min:typ:max
TLH_QN=0.62:2.27:3.92, THL_QN=0.61:2.245:3.88;

(CP *> Q) = (TLH_Q,THL_Q);
(CP *> QN) = (TLH_QN,THL_QN);

//Violation checking
$setup(D, posedge CP, TSU, NOTIFIER);
$hold(posedge CP, D, TH, NOTIFIER);
endspecify
endmodule
