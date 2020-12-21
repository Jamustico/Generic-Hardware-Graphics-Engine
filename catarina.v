// SR latch/flip-flop
/*

Tabela de verdade:

    |S   |R   | Q               | Função
    ----------------------------|------------
    |0   |0   | Latch           | Segura valor anteriormente guardado
    |0   |1   | 0               | Reset: Q = 0 (Guarda 0 em Q)
    |1   |0   | 1               | Set:   Q = 1 (Guarda 1 em Q)
    |1   |1   | Metaestabilidade| Indefinido

    legenda: Latch = Mantém valor anterior

             ~     = contrário [not] (contrário de Q é ~Q)
             |     = ou lógico [or]
*/
//sr latch
module dff(
  			clk,	// clock (entrada dinâmica
  			d, 		// entrada de dados
  			sout,	// saída para sr latch
  			rout	// saída para sr latch
			);  
  	
  	input wire clk,d;
  	output wire sout,rout;
  
  	  sr uut(
        	.rout(r),
        	.sout(s)
  			);
  
  	wire db;
  	
  	assign db = ~d;
  	
  always@(*) begin

      sout <= d  & clk;
      rout <= db & clk;
          
      end

  
endmodule


module sr(       
         s,     // set
         r,     // reset
         q,     // bit guardado
        qb);    // oposto do bit guardado

    input wire s,r; // declarar portos 's' e 'r' como 'fios' de 'entrada'

    output reg q,qb; // declarar portos 'q' e 'qb' como 'registos' de 'saída'

    wire qw,qbw; // declarar fios 'qw' e 'qbw' como fios (servem para conectar da saídas para as portas lógicas)
  


    always@* begin          // |always      |@*   |begin            |end
                            // |a qualquer  |*    |começa bloco     |termina bloco
                            // ('*' significa qualquer mudança de valores nas variaveis dentro do bloco de 'always' até 'end')

        qw  <= r ~| qbw;    // 1

        qbw <= s ~| qw;     // 2

        q   = qw;           // 3

        qb  = qbw;          // 4

        

    end

endmodule