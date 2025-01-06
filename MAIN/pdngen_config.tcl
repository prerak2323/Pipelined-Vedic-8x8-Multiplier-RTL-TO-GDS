# Configure power grid
pdngen::specify_grid \
    -name "CoreGrid" \
    -layer "met1" \
    -pitch "2.0" \
    -offset "1.0" \
    -nets {VDD VSS} \
    -width "0.5"

# Configure power rings around the core
pdngen::specify_ring \
    -layer "met2" \
    -width "1.0" \
    -nets {VDD VSS} \
    -core

# Configure vertical and horizontal straps
pdngen::specify_strap \
    -layer "met3" \
    -width "0.8" \
    -nets {VDD VSS} \
    -pitch "3.0"

# Connect supply pins to the power grid
pdngen::connect_pins_to_grid \
    -pins {PHY_EDGE_ROW_*_Left_*/VDD PHY_EDGE_ROW_*_Left_*/VSS} \
    -nets {VDD VSS}

# Ensure tapcells are properly connected
pdngen::specify_tapcell \
    -tapcell_master "TAPCELL" \
    -endcap_master "ENDCAP" \
    -pitch "20"

