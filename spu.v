/*

Sprite Processing Unit (SPU)

---
Generate Sprite:

-max = 6 sprites

per sprite registers:

    Top Left Pixel
    -x pos 
    -y pos

    Dimensions (until max,after porch)
    -height 
    -width

    Color
    -palette

---
Generate Background:

    -basic color
    -lines

*/

module spu(
    vrom, //Video rom
    controller, // register: |up|down|throw|pause
    clk, // latch dynamic signal
    data, // data to be written on vram buffer
    address // sprite control address
    );

    parameter controller_num = 2;
    parameter sprite_num = 6;

    input wire vrom;

    // controller is 4 bit wide
    input wire [3:0] controller [controller_num-1 : 0];

    input wire clk;

    //memory control
    output wire [8:0] data;
    output wire [15:0] address;

    //sprites attributes

    //x-pos
    reg [];
    
    //y-pos
    reg [];

    //height
    reg [];

    //width
    reg [];

    //pallette
    reg [];

    //sprite registers
    reg 

