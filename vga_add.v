//VGA Address Calculator
/*

        pixel is at address: (posy * pixels per line [aka widt]) + posx

        eg.
        
        height: 8
        width : 8

        
        +- - - - x - - - ->
        | □ □ □ □ □ □ □ □ 0
        | □ □ □ □ □ □ □ ■ 1
        | □ □ □ □ □ □ □ □ 2
        y □ □ □ □ □ □ □ □ 3
        | □ □ □ □ □ □ □ □ 4
        | □ □ □ □ □ □ □ □ 5
        | □ □ □ □ □ □ □ □ 6
        | □ □ □ □ □ □ □ □ 7
        ↓ 0 1 2 3 4 5 6 7 +

        x = pixel 7 
        y = pixel 1

        pixel is at address: 
        (y * width) + x 
      =>(1 * 8) + 7
      =>Address: 15

        minimum number of addresses:
        (7 * 8) + 7
      =>Address: 63

      64 addresses.

*/

module vga_add (
    posx,   // counter x position (w)
    posy,   // counter y position (h)
    eff     // memory effective address
    );

    parameter width = 200;

    input wire [8:0] posx;   // 'till visible h porch
    input wire [8:0] posy;   // 'till visible w porch

    output wire [15:0] eff;

    assign eff = (posy * width) + posx;

endmodule