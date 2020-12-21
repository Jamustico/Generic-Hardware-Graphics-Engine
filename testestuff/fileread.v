



module teste (

            pointer,
            data,
            clk

            );



    input [3:0] pointer;    // address bus
    output [7:0] data;      //data bus

    wire [3:0] pointer;         
    reg [7:0] data;

    reg [7:0] mem [0:3];    // big endian 4 bit address, 8 bit data wide memory


    initial begin

        $readmemh("batata.txt",mem); // ficheiro com os dados da rom
    

    end     

    always @(posedge clk) begin
        
        data <= mem [pointer];      // 'pointer' define o endereço 
        

    end

    


endmodule
