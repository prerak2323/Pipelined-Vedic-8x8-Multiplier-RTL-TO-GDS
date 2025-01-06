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
2. [Tools Used](#tools-used)
3. [Flow Overview](#flow-overview)
4. [Directory Structure](#directory-structure)
5. [How to Run the Flow](#how-to-run-the-flow)
6. [Results](#results)
7. [Contributions](#contributions)

## Project Setup

Ensure you have the following dependencies installed before running the flow:

- **Yosys**: Open-source synthesis tool.
- **OpenSTA**: Static timing and power analysis tool.
- **OpenROAD**: Tool for physical design and GDS generation.
