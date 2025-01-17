# Pipelned Vedic Multiplier - RTL to GDS Flow
This repository contains the design and implementation of a **Staged Vedic Multiplier** with throughput of 100000 OPS, a high-performance multiplier based on Vedic mathematics optimized for modern digital design flows. The project demonstrates the **RTL to GDS** flow, automating the essential steps in logic synthesis, timing analysis, power estimation, and physical design using a combination of open-source tools.

## BLock Diagram & RTL Simulation
<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/BLOCK_DIAGRAM.png">
<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/RTL_SIMULATION.png" >

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
## Routing Resources Analysis and Congestion Report

In this section, we summarize the **Routing Resources Analysis** and **Congestion Report** for the physical design of the **Staged Vedic Multiplier**.

### Routing Resources Analysis

During the routing stage of the design, the routing resources (i.e., metal layers) are analyzed to determine how efficiently the routing is distributed across different metal layers.

#### Routing Resource Distribution
The following table summarizes the analysis of routing resources for each metal layer, including the **original** resource count, the **derated** resource count, and the **reduction percentage**:

| Layer  | Direction  | Original Resources | Derated Resources | Reduction (%) |
|--------|------------|--------------------|-------------------|---------------|
| **metal1** | Horizontal | 0  | 0   | 0.00%  |
| **metal2** | Vertical   | 35,796 | 15,968 | 55.39% |
| **metal3** | Horizontal | 48,849 | 22,400 | 54.14% |
| **metal4** | Vertical   | 22,800 | 9,446  | 58.57% |
| **metal5** | Horizontal | 22,800 | 9,627  | 57.78% |
| **metal6** | Vertical   | 22,800 | 9,626  | 57.78% |
| **metal7** | Horizontal | 6,555  | 3,057  | 53.36% |
| **metal8** | Vertical   | 6,555  | 3,192  | 51.30% |
| **metal9** | Horizontal | 3,249  | 3,136  | 3.48%  |
| **metal10** | Vertical  | 3,249  | 3,136  | 3.48%  |

This table indicates that the design uses **multiple metal layers** for routing, with a notable **reduction in the number of resources** in the **derated** columns, which corresponds to efficient utilization of available resources.

#### Via Usage

- **Total number of vias related to pin nodes**: 6,387
- **Total number of vias related to Steiner nodes**: 112
- **Final number of vias**: 7,934
- **Total 3D via usage**: 29,598

The number of vias required in the design is significant, with the majority of vias being related to pin nodes, ensuring the design's connectivity across the layout. The 3D via usage metric represents the total via resources consumed during routing.

---

### Final Congestion Report

Congestion is a critical factor in ensuring that the physical design of the circuit can be effectively manufactured. A congestion report provides insights into the usage of the routing resources on each layer.

#### Congestion Analysis for Routing Layers

The table below summarizes the **congestion report** across different metal layers, showing the **resource usage** (in percentage), **demand**, and **overflow** (if any):

| Layer  | Resource   | Demand  | Usage (%) | Max H / Max V / Total Overflow |
|--------|------------|---------|-----------|--------------------------------|
| **metal1** | 0        | 0       | 0.00%     | 0 / 0 / 0                      |
| **metal2** | 15,968   | 2,630   | 16.47%    | 0 / 0 / 0                      |
| **metal3** | 22,400   | 2,974   | 13.28%    | 0 / 0 / 0                      |
| **metal4** | 9,446    | 79      | 0.84%     | 0 / 0 / 0                      |
| **metal5** | 9,627    | 0       | 0.00%     | 0 / 0 / 0                      |
| **metal6** | 9,626    | 62      | 0.64%     | 0 / 0 / 0                      |
| **metal7** | 3,057    | 51      | 1.67%     | 0 / 0 / 0                      |
| **metal8** | 3,192    | 0       | 0.00%     | 0 / 0 / 0                      |
| **metal9** | 3,136    | 0       | 0.00%     | 0 / 0 / 0                      |
| **metal10** | 3,136   | 0       | 0.00%     | 0 / 0 / 0                      |

The **maximum overflow** values for each layer are **0**, indicating that there are no issues with congestion on the metal layers, and the routing has been effectively distributed. The usage percentage across the layers is relatively low, indicating a well-balanced design.

#### Total Wirelength and Routed Nets

- **Total wirelength**: 17,892 µm
- **Total routed nets**: 1,085

The **total wirelength** reflects the overall length of the interconnects required for the design, and the number of **routed nets** shows the number of individual signals that were successfully routed in the design. These values are essential for estimating the performance and area of the final chip.

---

## Conclusion

The **Routing Resources Analysis** and **Congestion Report** indicate that the physical design has been effectively routed, with minimal congestion and efficient resource utilization. The design successfully meets the required constraints for routing, and the final **GDS** layout is expected to be manufacturable without any major routing issues.

<img src="https://github.com/prerak2323/Pipelined-Vedic-8x8-Multiplier-RTL-TO-GDS/blob/main/MAIN/GDS/ROUTING_DENSITY.png">

---


## Timing and Power Analysis
### Worst Slack Analysis
- **Worst Slack (min)**: 0.077
- **Worst Slack (max)**: 6.970

### Total Negative Slack (TNS)
- **TNS**: 0.000

### Clock Skew Analysis
- **Clock**: clk
  - **Source Latency**: 0.078 _186_/CK ^
  - **Target Latency**: -0.073 _165_/CK ^
  - **CRPR**: 0.000
  - **Setup Skew**: 0.005

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





