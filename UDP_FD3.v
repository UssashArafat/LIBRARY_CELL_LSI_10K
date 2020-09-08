/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: FD3
 * File: UDP_FD3.v
 * ***************************************************************************************************
 * UDP for FD3
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

//Creating User-Defined-Primitives (UDP)
primitive UDP_FD3(OUTPUT, CLOCK, CLEAR, PRESET, DATA, NOTIFIER);
input CLOCK, CLEAR, PRESET, DATA, NOTIFIER;
output OUTPUT;
reg OUTPUT;

//Describing Operation
table
//CLOCK  CLEAR  PRESET  DATA  NOTIFIER : PRESET STATE : NEXT STATE

//CLEAR logic
    ?      0      1       ?       ?    :       ?      :     0;
    ?      *      1       ?       ?    :       0      :     0;
//PRESET logic
    ?      1      0       ?       ?    :       ?      :     1;
    ?      1      *       ?       ?    :       1      :     1;
//Normal clocking logic  
    r      1      1       0       ?    :       ?      :     0;
    r      1      1       1       ?    :       ?      :     1;
    n      ?      ?       ?       ?    :       ?      :     -;
//Steady state logic
    b      ?      ?       *       ?    :       ?      :     -;
//If NOTIFIER toggles, output goes to unknown
    ?      ?      ?       ?       *    :       ?      :     x;
endtable
endprimitive
