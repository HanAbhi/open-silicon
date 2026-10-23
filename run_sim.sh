#!/usr/bin/env bash
set -euo pipefail

echo "Compiling ALU and testbench..."
iverilog -g2012 -o alu_test alu.v tb_alu.v

echo "Running simulation..."
vvp alu_test
