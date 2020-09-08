/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: FT2P
 * File: UDP_FT2P.v
 * ***************************************************************************************************
 * UDP for FT2P
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

//Creating User-Defined-Primitives (UDP)
primitive UDP_FT2P(OUTPUT, CLOCK, CLEAR);
input CLOCK, CLEAR;
output OUTPUT;
reg OUTPUT;

//Describing Operation
table
//CLOCK  CLEAR : PRESET STATE : NEXT STATE

//CLEAR logic
    ?      0   :       ?      :     0;
    ?      *   :       0      :     0;
//Normal clocking logic
    r      1   :       0      :     1;
    r      1   :       1      :     0;
    n      ?   :       ?      :     -;
endtable
endprimitive
