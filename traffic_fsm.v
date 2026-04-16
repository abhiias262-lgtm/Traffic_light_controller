module traffic_light (
    input clk,
    input rst,
    output reg [2:0] signal 
);
    parameter RED = 3'b100 ,
            YELLOW= 3'b010 ,
            GREEN = 3'b001;
            

    reg [1:0] state ,next_state;
    reg[3:0] timer;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state<=RED;
            timer<=0;
        end 
        else begin
            timer<=timer+1;
            if (timer==9)begin
                state<= next_state ;
                timer<=0;
            end
        end        
    end

    always@(*)begin
        case (state)
            RED :    next_state=YELLOW;
            YELLOW:  next_state=GREEN;
            GREEN:   next_state=RED;
            default: next_state=RED;
        endcase
    end

    always @(*) begin
        case (state)
            RED:    signal=3'b100;
            YELLOW: signal=3'b010;
            GREEN:  signal=3'b001;
            default:signal=3'b100;            
        endcase
    end
endmodule

module tb_traffic_light;
    reg clk, rst;
    wire [2:0] signal;

    traffic_light dut (.clk(clk), .rst(rst), .signal(signal));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1;
        #5 rst =0;
        #200 ;
        $finish;
    end

    initial $monitor("t=%0t signal=%b", $time, signal);
endmodule