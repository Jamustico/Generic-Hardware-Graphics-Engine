/*
    Modules Agregator

    This file contains all vga modules for the sake of
    signal control


*/

module vga(clk,spudata,spupointer,hsync,vsync,videoout);


    input clk;                  // master clock
    input [8:0] spudata;        // sprite processing unit data bus
    input [15:0] spupointer;    // sprite processing unit address bus
    
    output hsync;               // hsync signal for vga connector
    output vsync;               // vsync signal for vga connector
    output [8:0] videoout;      // video output to the 3bit dac

    // to do: variable types,module description and
    // module connections












endmodule