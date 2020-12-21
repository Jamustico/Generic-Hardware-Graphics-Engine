`include"vga_counter.v"

module vga_counter_tb; 


    reg  clk;
    wire hsync,vsync;
    wire display;
    wire [8:0] hcounter;

    wire [10:0] vcounter;


initial begin
    $dumpfile("counter.vcd");

    $dumpvars(0,vga_counter_tb);
end

initial begin
    
    clk <= 0;
    
end

always begin
    
    #1 clk = !clk;
    
    if (vcounter == 628) begin
        $finish;
    end
  
    /*
    if (vcounter == 1) begin
        $monitor("Eureka!");
    end
    *7


  /*  
    if ($time == 2*160) begin
        $finish;
    end
*/
end



vga_counter uut(
    .clk(clk),
    .hcounter(hcounter),
    .vcounter(vcounter),
    .hsync(hsync),
    .vsync(vsync),
    .display(display)   
);


endmodule
    