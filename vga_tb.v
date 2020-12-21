// Modules so far:
/*

    - counter;
    - address calculator;
    - random access memory

*/

`include "vga_counter.v"
`include "vga_add.v"
`include "vga_vram.v"

module vga;

reg tb_clk;

// counter

wire [8:0]  iX;
wire [10:0] iY; 
wire display;

// address calculator

wire [15:0] pointer;


// video ram








vga_counter counter(
    .clk(tb_clk),
    .hcounter(iX),
    .vcounter(iY),
    .display(display)
);

vga_add address_calc(
    .posx(iX),
    .posy(iY),
    .eff(pointer)
);

vram videoram(
    .rw(),
    .cs(),
    .oe(),
    .Address_bus(),
    .Data_bus()
);

endmodule