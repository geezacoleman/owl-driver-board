#!/bin/bash
jlc-kicad-tools -n owl-driver-board-16 --warn-no-lcsc-partnumber -v -d cpl_rotations_db.csv  .

# Move J2 from top to bottom
sed -i 's/^\(J2,.*,\)top/\1bottom/' owl-driver-board-16_cpl_jlc.csv

