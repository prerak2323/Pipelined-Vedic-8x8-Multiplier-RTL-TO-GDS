# Pipelned Vedic Multiplier - RTL to GDS Flow
This repository contains the design and implementation of a **Staged Vedic Multiplier** with throughput of 100000 OPS, a high-performance multiplier based on Vedic mathematics optimized for modern digital design flows. The project demonstrates the **RTL to GDS** flow, automating the essential steps in logic synthesis, timing analysis, power estimation, and physical design using a combination of open-source tools.

## BLock Diagram & RTL Simulation
<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/BLOCK_DIAGRAM.png">


## Project Overview

The project involves creating a **Staged Vedic Multiplier** and executing it through the full **RTL-to-GDS** flow. The steps include **RTL coding**, **functional verification**, **synthesis**, **timing and power analysis**, and **physical design** (including floorplanning, placement, clock tree synthesis, routing).

The following open-source tools are used in this flow:
- **Yosys** for **Logic Synthesis**
- **OpenSTA** for **Timing and Power Analysis**
- **OpenROAD** for **Physical Design and Layout**
- **TCL Scripts** for **Flow Automation**


## Project Setup

Ensure you have the following dependencies installed before running the flow:

- **Yosys**: Open-source synthesis tool.
- **OpenSTA**: Static timing and power analysis tool.
- **OpenROAD**: Tool for physical design and GDS generation.

## Flow OverviewStaged-Vedic-Multiplier-RTL-to-GDS

- Write the RTL code in Verilog for the Staged Vedic Multiplier. This file is located in the rtl/ directory.
- Develop a testbench to verify the functionality of the RTL design. This testbench is responsible for applying test vectors and checking the output.
- Perform logic synthesis using the Nangate45_typ.lib technology library, with the help of constraints.sdc file. This converts the RTL code into a gate-level netlist.
- Run Gate-Level Simulation (GLS) to ensure the synthesized design matches the functional behavior of the RTL.
- Run static timing analysis using OpenSTA to ensure that the design meets the required timing constraints.
- Estimate the power consumption of the design using OpenSTA.
- Start Physical Design

<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/GDS/PLACEMENT_DENSITY.png">
<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/GDS/SIGNAL_ROUTING.png">

  1. Define the floorplan for the design, which includes the distribution of cells, macro blocks, and core area.
  2. Set up of power distribution network.
  3. Perform global placement, where the cells are placed roughly in the layout based on the floorplan.
  4. Refine the placement using detailed placement to optimize cell positions, taking into account timing, congestion, and other physical design constraints.
  5. Perform clock tree synthesis (CTS) to insert clock buffers and ensure balanced clock delivery to all registers.
  6. Perform final routing to connect all the cells using metal layers, ensuring that signal paths meet timing and physical design rules.
- die_area {0 0 120 120}
- core_area {10 10 110 110}
- target_density 0.45

<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/GDS/FINAL_ROUTING.png">

<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/GDS/POWER_GND_SIGNAL_CLK_ROUT.png">

## Directory Structure 

```plaintext
Staged-Vedic-Multiplier-RTL-to-GDS
├── rtl/                          # RTL (Verilog) files for the multiplier design
│   ├── vedic8x8.v                # 8x8 Vedic multiplier module
│   ├── vedic4x4.v                # 4x4 Vedic multiplier module
│   ├── vedic2x2.v                # 2x2 Vedic multiplier module
│   ├── csa4.v                    # 4-bit Carry Save Adder
│   ├── csa8.v                    # 8-bit Carry Save Adder
│   ├── FullAdder.v               # Full adder module
│   ├── HalfAdder.v               # Half adder module
├── testbench/                    # Testbench files for RTL verification
│   ├── tb.v                      # Testbench for Vedic multiplier
├── synthesis/                    # Synthesis scripts and outputs
│   ├── opt.tcl                   # Synthesis optimization script
│   ├── constraints.sdc           # SDC constraints file for synthesis
│   ├── netlist_opt_synthesised.v  # Optimized synthesized netlist
├── timing_analysis/              # Timing analysis reports
│   ├── vedic8x8_sta.txt          # Timing analysis report for 8x8 multiplier
├── power_analysis/               # Power analysis reports
│   ├── vedic8x8_sta.txt          # Power estimation for 8x8 multiplier
├── physical_design/Nangate45     # Physical design scripts and results
│   ├── gcd_nangate45_copy.tcl     # Nangate45 process library setup script
│   ├── flow_floorplan.tcl        # Floorplan definition script
│   ├── flow_pdn.tcl              # Power Distribution Network (PDN) script
│   ├── flow_global_placement.tcl # Global placement script
│   ├── flow_detailed_placement.tcl # Detailed placement script
│   ├── flow_cts.tcl              # Clock Tree Synthesis (CTS) script
│   ├── flow.tcl                  # Main physical design flow script
│   ├── GDS                       # Folder containing the final GDS file
│   ├── results                   # Folder containing intermediate results
├── scripts/                       # TCL automation scripts for flow
│   ├── gcd_nangate45_copt.tcl     # Optimization script for Nangate45 library
└── README.md
```

<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/GDS/ROUTING_DENSITY.png">

---
## Timing and Power Analysis
### Worst Slack Analysis
- **Worst Slack (min)**: 0.077
- **Worst Slack (max)**: 6.970

### Total Negative Slack (TNS)
- **TNS**: 0.000

<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/GDS/POWER_EDNSITY.png">
<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/GDS/CTS.png">


### Power Breakdown Analysis
| Group          | Internal Power | Switching Power | Leakage Power | Total Power (Watts) | Contribution (%) |
|-----------------|-----------------|------------------|---------------|----------------------|-------------------|
| Sequential      | 1.27e-04        | 2.67e-05         | 9.23e-06      | 1.63e-04             | 29.0%             |
| Combinational   | 2.14e-04        | 9.98e-05         | 3.39e-05      | 3.48e-04             | 61.7%             |
| Clock           | 2.23e-05        | 2.90e-05         | 1.26e-06      | 5.25e-05             | 9.3%              |
| Macro           | 0.00e+00        | 0.00e+00         | 0.00e+00      | 0.00e+00             | 0.0%              |
| Pad             | 0.00e+00        | 0.00e+00         | 0.00e+00      | 0.00e+00             | 0.0%              |
| **Total**       | 3.64e-04        | 1.56e-04         | 4.44e-05      | 5.64e-04             | 100.0%            |

### Inference:
- **Combinational Power Dominance**: The combinational logic group consumes the majority of the power (61.7%), indicating a need for further optimization in this area, such as reducing switching activities and optimizing logic gates.
- **Sequential and Clock Contributions**: Both sequential and clock-related elements contribute significantly, highlighting the importance of power-aware design techniques in flip-flops, latches, and clock tree structures.
- **Macro and Pad Power**: These components contribute minimally, suggesting they are well-optimized or have negligible power contributions.
- **Total Power Efficiency**: The total power consumption breakdown highlights areas where further power reduction efforts should be focused to improve overall design efficiency.





