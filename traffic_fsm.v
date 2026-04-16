module traffic_light(
    input clk,rst,
    output reg [1:0] NT,WT,ST,ET


);

    reg [1:0] current_state;
    reg [1:0] next_state;

// light signal 
    parameter   RED = 01,
                YELLOW=10,
                GREEN=11,
                NONE=00;

// STATES 

    parameter   IDLE=000,
                NORTH=001,
                SOUTH=010,
                EAST=011,
                WEST=100;



// waiting time
    parameter switching_time = 60 ;
    reg [7:0] counter;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter<=8'b0;
        end
        else if(counter<=60) begin
            counter<=counter+1'b1;
        end
    end
    wire timeout=(counter==switching_time);

    always @(posedge clk or posedge rst) begin
    if(rst)begin
        current_state<=IDLE;
    end
    else 
        current_state<=next_state;
    end
    always @(*) begin 
        next_state=current_state;
        case (current_state)
            IDLE:
            NORTH:
            EAST:
            WEST:
            SOUTH:
      
        
        endcase
    end


endmodule