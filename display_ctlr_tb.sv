`include"vga_add.v"

module vga_add_tb;

reg [8:0] posx_w;
reg [8:0] posy_w;

wire [15:0] eff_r;

vga_add UUT(
    .posx(posx_w),
    .posy(posy_w),
    .eff(eff_r)
);

initial begin 

   
    posy_w = 10;
    posx_w = 20;
    
    $monitor("X: %d Y: %d Eff: %d",posx_w,posy_w,eff_r);
    #10
    posy_w = 149;
    posx_w = 199;
    
    $monitor("X: %d Y: %d Eff: %d",posx_w,posy_w,eff_r);
    
    #10
    posy_w = 100;
    posx_w = 100;
    
    $monitor("X: %d Y: %d Eff: %d",posx_w,posy_w,eff_r);
    
    #10
    posy_w = 0;
    posx_w = 0;
    
    $monitor("X: %d Y: %d Eff: %d",posx_w,posy_w,eff_r);

    #10
    posy_w = 0;
    posx_w = 1;
    
    $monitor("X: %d Y: %d Eff: %d",posx_w,posy_w,eff_r);

    #10
    posy_w = 1;
    posx_w = 0;
    
    $monitor("X: %d Y: %d Eff: %d",posx_w,posy_w,eff_r);

    end

endmodule