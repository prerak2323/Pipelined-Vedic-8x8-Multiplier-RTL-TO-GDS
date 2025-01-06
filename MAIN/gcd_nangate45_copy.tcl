# gcd flow pipe cleaner
source "helpers.tcl" 
source "flow_helpers.tcl"
source "Nangate45/Nangate45.vars"

set design "vedic8x8"
set top_module "vedic8x8"
set synth_verilog "netlist_final_opt.v"
set sdc_file "constrains.sdc"
set die_area {0 0 120 120}
set core_area {10 10 110 110}
set target_density 0.45

#source -echo "flow_floorplan.tcl"
#source -echo "flow_pdn.tcl"
#source -echo "flow_global_placement.tcl"
#source -echo "flow_detailed_placement.tcl"
#source -echo "flow_cts.tcl"
source -echo "flow.tcl"

