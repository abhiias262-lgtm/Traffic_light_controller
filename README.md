# Traffic Light Controller

A Verilog implementation of a 3-state traffic light controller. The controller uses a finite state machine (FSM) to transition between Red, Yellow, and Green states at set timer intervals.

## Module Interface

| Port Name | Direction | Width | Description |
|:---|:---|:---|:---|
| clk | Input | 1 bit | System clock signal |
| rst | Input | 1 bit | Active-high reset signal |
| signal | Output | 3 bits | One-hot encoded output representing [Red, Yellow, Green] |

## Finite State Machine

The FSM transitions sequentially on the rising edge of the clock when the internal timer reaches its threshold (10 clock cycles):

1. **RED** (`3'b100`): Active for 10 cycles. Transitions to **YELLOW**.
2. **YELLOW** (`3'b010`): Active for 10 cycles. Transitions to **GREEN**.
3. **GREEN** (`3'b001`): Active for 10 cycles. Transitions to **RED**.

## Simulation

A testbench (`tb_traffic_light`) is included in the source file to verify the FSM transitions.

### Compilation and Execution

To compile the source code using Icarus Verilog:
```bash
iverilog -o traffic_control.out traffic_fsm.v
```

To run the compiled simulation output:
```bash
vvp traffic_control.out
```
