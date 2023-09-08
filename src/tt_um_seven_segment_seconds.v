`default_nettype none

module tt_um_seven_segment_seconds (
    
    // Module arguments
    input wire  [7:0] ui_in,
    output reg  [7:0] uo_out,
    input wire  [7:0] uio_in,
    output reg  [7:0] uio_out,
    output reg  [7:0] uio_oe,
    input wire  ena,
    input wire  clk,
    input wire  rst_n
    
);
    
    // Stub signals
    reg  [7:0] my_reg$d;
    wire  [7:0] my_reg$q;
    reg  my_reg$clock;

    
    // Sub module instances
    top$my_reg my_reg(
        .d(my_reg$d),
        .q(my_reg$q),
        .clock(my_reg$clock)
    );
    
    // Update code
    always @(*) begin
        my_reg$clock = clk;
        my_reg$d = my_reg$q;
        my_reg$d = ui_in + uio_in;
        uo_out = my_reg$q;
        uio_out = my_reg$q;
        uio_oe = my_reg$q;
    end
    
endmodule // top


module top$my_reg(d,q,clock);
    
    // Module arguments
    input wire  [7:0] d;
    output reg  [7:0] q;
    input wire  clock;
    
    // Update code (custom)
    initial begin
       q = 8'h0;
    end
    
    always @(posedge clock) begin
       q <= d;
    end
          
endmodule // top$my_reg
