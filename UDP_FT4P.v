/*******************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * Library: lsi_10k
 * Target Cell: FT4P
 * File: UDP_FT4P.v
 * ***************************************************************************************************
 * UDP for FT4P
 * ***************************************************************************************************/

`timescale 1ns/1ps //Declaring referernce time and time precision

//Creating User-Defined-Primitives (UDP)
primitive UDP_FT4P(OUTPUT, CLOCK, PRESET);
input CLOCK, PRESET;
output OUTPUT;
reg OUTPUT;

//Describing Operation
table
//CLOCK PRESET : PRESET STATE : NEXT STATE

//CLEAR logic
    ?      0   :       ?      :     1;
    ?      *   :       1      :     1;
//Normal clocking logic
    r      1   :       0      :     1;
    r      1   :       1      :     0;
    n      ?   :       ?      :     -;
endtable
endprimitive
