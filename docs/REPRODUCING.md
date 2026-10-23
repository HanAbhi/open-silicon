# Reproducing the Open Silicon Experiment

This guide describes how to run the ALU simulation and locate
the configuration used for the OpenLane physical-design run.

## Tool Versions

Versions recorded from the development environment:

- OpenLane: 2.3.10
- Icarus Verilog: 11.0
- Yosys: 0.9
- PDK: SkyWater SKY130A

Your installed versions may differ.

## 1. Run Functional Simulation

Install Icarus Verilog and ensure `iverilog` and `vvp` are
available in your PATH.

From the repository root, run:

```bash
./run_sim.sh Expected result:

PASS: All 1536 ALU test cases passed.
```

The testbench checks all 16 x 16 input combinations for each
of the six supported ALU operations.


##  2. OpenLane Configuration
The project configuration is located at:

alu/config.yaml

It points OpenLane to the RTL source:

alu/src/alu.v

The configuration specifies a nominal clock period of 10
and an empty clock port. The design is combinational, so this
setting should not be interpreted as validated clock timing
or an operating-frequency result.

## 3. Physical Design
The original completed run was:

RUN_2026-10-19_12-32-43

The run used OpenLane 2 with the SkyWater SKY130A PDK and
generated a GDSII layout for inspection in KLayout.

The original run directory is excluded from Git, so the
detailed reports and generated layout files are not included
in a fresh clone.

To reproduce this stage, install and configure OpenLane and
the required PDK using the official documentation before
running the flow with the project's configuration.

## 4. Limitations
This is an educational design experiment, not a fabricated
chip or production-ready signoff.

The original run reported passing DRC, LVS, and antenna
checks. It also reported an IR-drop warning because no
VSRC_LOC_FILES were supplied.

A generic fallback SDC was used. Validated operating-frequency
and clock-timing signoff are not claimed.
