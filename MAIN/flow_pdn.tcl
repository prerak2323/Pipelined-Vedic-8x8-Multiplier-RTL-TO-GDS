# Assumes flow_helpers.tcl has been read.
read_libraries
read_verilog $synth_verilog
link_design $top_module 
read_sdc $sdc_file


utl::metric "IFP::ord_version" [ord::openroad_git_describe]
utl::metric "IFP::instance_count" [sta::network_instance_count]

initialize_floorplan -site $site \
  -die_area $die_area \
  -core_area $core_area
write_def GDS/post_floorplan.def
source $tracks_file

# Remove buffers inserted by synthesis 
remove_buffers

################################################################
# IO Placement (random)
place_pins -random -hor_layers $io_placer_hor_layer -ver_layers $io_placer_ver_layer

################################################################
# Macro Placement
if { [have_macros] } {
  global_placement -density $global_place_density
  macro_placement -halo $macro_place_halo -channel $macro_place_channel
}
write_def GDS/post_macro_placement.tcl

################################################################
# Tapcell insertion
eval tapcell $tapcell_args
write_def GDS/post_tapcell.def

# Load PDN configuration and generate PDN
source $pdn_cfg
pdngen 

write_def GDS/post_pdn.def



