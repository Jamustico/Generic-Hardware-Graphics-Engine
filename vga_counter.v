/*
**************************
res: 800x600

Nominal Timmings (f = 40Mhz)

-------------
Horizontal:
-Total:1056
        
-Visible:800    
-F.Porch:40     
-SyncPuls:128   
-B.Porch:88     

-------------
Vertical:
-Total:628
                
-Visible:600
-F.Porch:1      
-SyncPuls:4     
-B.Porch:23     
                

**************************
res: 200x150

New Timming  (f'=10MHz; f'= f * 1/4)

-------------
Horizontal:
-Total:264
                Δ#pix 
-Visible:200    
-F.Porch:10     |200
-SyncPuls:32    |210
-B.Porch:22     |242
                |264
-------------
Vertical:
-Total:628
                Δ#pix
-Visible:600
-F.Porch:1      |600
-SyncPuls:4     |601
-B.Porch:23     |605
                |628

*/

module vga_counter (
    clk,      // clock signal
    hsync,    // sinal Hsync
    vsync,    // sinal Vsync
    hcounter, // horizontal signal counter
    vcounter, // vertical signal counter
    display   // display enable
    );
    
    // horizontal parameters for VGA control signal generation
    parameter hstart = 0;     
    parameter hfporch = 200;
    parameter hsyncpulse = 210;
    parameter hbporch = 242;
    parameter hfinish = 264;

    // veritcal parameters for VGA control signal generation
    parameter vstart = 0;
    parameter vfporch = 600;
    parameter vsyncpulse = 601;
    parameter vbporch = 604;
    parameter vfinish = 628;
    /*parameter res = 199;*/

    // clock
    input wire clk;

    // vga synchronization signals
    output reg hsync;
    output reg vsync;

    // Indicates wether it should or shouldn't display the image (outside of range,after front porch)
    reg hdisplay,vdisplay;
    output wire display;

    // displays signal in between both horizontal and vertical front porch
    assign display = hdisplay & vdisplay;

    //contadores
    output [8:0] hcounter;  //max 265
    output [10:0] vcounter;    //max 628

    reg [8:0] hcounter;
    reg [10:0] vcounter;


    
    

    // horizontal signals initialization
    initial begin
        hcounter <= 9'b000000000;
        hdisplay <= 1'b1;
        hsync    <= 1'b1;
        end

    initial begin

        vcounter <= 11'b00000000000;
        vdisplay <= 1'b1;
        vsync    <= 1'b1;
    end
    
    always @(posedge clk) begin
        
        hcounter <= hcounter + 1;

        if (hcounter == hfinish) begin

            hcounter <= 0;
            vcounter <= vcounter + 1;   // at the end of line,jumps to next line
        
        // Vertical Signal Control

            if (vcounter == vfinish) begin
                
                vcounter <= 0;

            end

            if (vcounter == 0) begin

               vdisplay <= 1; 

            end

            if (vcounter == vfporch) begin
                
                vdisplay <= 0;

            end

            if (vcounter == vsyncpulse)begin
                
                vsync <= 0;

            end

            if (vcounter == vbporch) begin
                
                vsync <= 1;

            end

        // VSC end

        end
        if (hcounter == 0) begin
            
            hdisplay <= 1;

        end

        if (hcounter == hfporch) begin
            
            hdisplay <= 0;

        end


        if (hcounter == hsyncpulse) begin

            hsync <= 0;

        end

        if (hcounter == hbporch) begin
            
            hsync <= 1;

        end

    end
    
endmodule