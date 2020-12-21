//ram tb
`include"vga_vram.v"

module vram_tb;

reg [15:0] Address_bus;

wire [8:0] data_r; //usado para fazer a leitura do Data_bus
reg [8:0] data_w;   //usado para escrever na memória

reg rw;
reg cs;
reg oe;

vram uut(
    .Address_bus(Address_bus),
    .Data_bus(data_r),
    .rw(rw),
    .cs(cs),
    .oe(oe)
);



initial begin
    
    //write b111000000 => h000A (cor vermelha)
    //      b000000111 => h000B (cor verde)
    //      b000111000 => h000C (cor verde)
    $dumpfile("test.vcd");
    $dumpvars(0,vram_tb);

    data_w = data_r;

    cs = 1;
    oe = 1;
    rw = 0;

    Address_bus = 16'h000A;   
    data_w = 9'b111000000;

    cs = 0;
    oe = 0;
    rw = 0;

    #10

    cs = 1;
    oe = 1;
    rw = 0;

    Address_bus = 16'h000B;
    data_w = 9'b000000111;

    
    cs = 0;
    oe = 0;
    rw = 0;

    #10

    cs = 1;
    oe = 1;
    rw = 0;

    Address_bus = 16'h000C;
    data_w = 9'b000111000;

    cs = 0;
    oe = 0;
    rw = 0;

    #10

    

    //read address h000C
    //     address h000A
    //     address h000B
    $display("|ADD  |DATA    |");

    Address_bus = 16'h000C;

    cs = 1;
    oe = 1;
    rw = 1;

    $monitor("|H%h|b%b|",Address_bus,data_r);

    cs = 0;
    oe = 0;
    rw = 0;
    
    #10

    cs = 1;
    oe = 1;
    rw = 1;

    Address_bus = 16'h000A;
    $monitor("|H%h|b%b|",Address_bus,data_r);

    cs = 0;
    oe = 0;
    rw = 0;

    #10

    cs = 1;
    oe = 1;
    rw = 1;

    Address_bus = 16'h000B;
    $monitor("|H%h|b%b|",Address_bus,data_r);

    cs = 0;
    oe = 0;
    rw = 0;

end
/*

    $monitor("|   |   |");
    $monitor("|H%h|b%b|",Address_bus,Data_w);
*/
endmodule