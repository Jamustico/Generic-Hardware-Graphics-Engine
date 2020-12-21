iverilog -o counter.o vga_counter_tb.v
vvp counter.o
gtkwave counter.vcd