# Pipelned Vedic Multiplier - RTL to GDS Flow
This repository contains the design and implementation of a **Staged Vedic Multiplier**, a high-performance multiplier based on Vedic mathematics optimized for modern digital design flows. The project demonstrates the **RTL to GDS** flow, automating the essential steps in logic synthesis, timing analysis, power estimation, and physical design using a combination of open-source tools.

## Project Overview

The project involves creating a **Staged Vedic Multiplier** and executing it through the full **RTL-to-GDS** flow. The steps include **RTL coding**, **functional verification**, **synthesis**, **timing and power analysis**, and **physical design** (including floorplanning, placement, clock tree synthesis, routing).

The following open-source tools are used in this flow:
- **Yosys** for **Logic Synthesis**
- **OpenSTA** for **Timing and Power Analysis**
- **OpenROAD** for **Physical Design and Layout**
- **TCL Scripts** for **Flow Automation**

## Table of Contents

1. [Project Setup](#project-setup)
2. [Flow Overview](#flow-overview)
4. [Directory Structure](#directory-structure)
5. [How to Run the Flow](#how-to-run-the-flow)
6. [Results](#results)
7. [Contributions](#contributions)

## Project Setup

Ensure you have the following dependencies installed before running the flow:

- **Yosys**: Open-source synthesis tool.
- **OpenSTA**: Static timing and power analysis tool.
- **OpenROAD**: Tool for physical design and GDS generation.

## Flow Overview

- Write the RTL code in Verilog for the Staged Vedic Multiplier. This file is located in the rtl/ directory.
- Develop a testbench to verify the functionality of the RTL design. This testbench is responsible for applying test vectors and checking the output.
- Perform logic synthesis using the Nangate45_typ.lib technology library, with the help of constraints.sdc file. This converts the RTL code into a gate-level netlist.
- Run Gate-Level Simulation (GLS) to ensure the synthesized design matches the functional behavior of the RTL.
- Run static timing analysis using OpenSTA to ensure that the design meets the required timing constraints.
- Estimate the power consumption of the design using OpenSTA.
- Start Physical Design
  1.

