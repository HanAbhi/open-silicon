# Open Silicon: A 4-Bit ALU ASIC Experiment

An simple project exploring an open-source ASIC design flow,
from Verilog RTL to a physical GDSII layout.

## Project Overview

This 4-bit Arithmetic Logic Unit (ALU) supports:
- Addition with carry-out
- Subtraction
- Bitwise AND
- Bitwise OR
- Bitwise XOR
- Bitwise NOT

## Tools Used

- Verilog for RTL design
- Icarus Verilog for simulation
- Yosys for logic synthesis
- OpenLane 2 for physical design
- SkyWater SKY130 PDK
- KLayout for layout inspection

## Simulation Results

The testbench checks 16 × 16 input combinations across six
operations, for a total of 1,536 test cases.

Result: All 1,536 ALU test cases passed.

Run the simulation from the project root:

```bash
iverilog -o alu_test alu.v tb_alu.v
vvp alu_test

## Physical Layout

The following image shows the ALU layout generated during this
open-source ASIC design experiment.

![ALU physical layout](docs/images/alu-layout.png)
