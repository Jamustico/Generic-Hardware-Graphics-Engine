// 9 bit wide RAM for video output.
/*

    Address size: Width * Height
    Max Address: Width * Height - 1
    Address bus: log2(Address Size)

    Data Bus: 9 bit (3 bits per channel) 
    Data Bus Control: |r2|r1|r0|g2|g1|g0|b2|b1|b0|

    where x2 is the most significant bit on the channel
    and x0 is the less significant bit on the channel

    -----------
    To enable the chip for read/write,bring cs (Chip Select) signal to a high
    To write, bring 

*/

module vram (
    Address_bus,    // Barramento de endereços gerado pela calculadora
                    //de endereços.

    Data_bus,       // Barramento de dados,que é usado para ler e escrever
                    //na memória

    cs,             // chip select
                    // quando cs = 1,é permitido ler e escrever

    oe,             // output enable
                    // quando oe = 1,valores no Data_bus são 
                    //os do endereço correspondente
                    // quando oe = 0,valores no Data_bus são
                    //'high-z'

    rw              // read/write 
                    // quando rw = 1,lê valores no endereço(address_bus)
                    // quando rw = 0,escreve data_bus em *(address_bus)
    
);
    parameter address_size = 30000 ;

    input wire rw; 
    input wire cs;
    input wire oe;

    inout [8:0] Data_bus;
    input [15:0] Address_bus;

    wire [8:0] Data_bus;
    wire[15:0] Address_bus;


    reg [15:0] Address; // registo onde se guarda o valor lido do 
                        //barramento de endereços    

    reg [8:0] Mem [address_size-1:0]; // memória com: #address_size-1 endereços
                                      //de 9 bits

    wire [8:0] Data_i; // fios de saída usados quando o porto bi-direcional
                       //'Data_bus' (barramento de dados) é usado para escrita
                       //na memória

    reg  [8:0] Data_o; // registo onde é guardado o valor proveniente da memória 
                       //'Mem' quando há uma leitura no porto bi-direcional 'Data_bus'

    assign Data_bus = Data_o;
    assign Data_bus = Data_i;

    always @(posedge cs) begin

        Address = Address_bus;

        if (oe) 
            
            if (rw) begin
                Data_o = Mem[Address]; //outputs mem
            end
            else begin
                Mem[Address] = Data_i; //inputs data from databus
            end 

        
        else
            
            if (rw)
                Data_o = 9'bz; //high-z
    end

endmodule