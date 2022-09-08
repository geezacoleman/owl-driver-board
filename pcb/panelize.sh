#!/bin/bash

kikit panelize  \
  --layout 'grid; rows: 2; cols: 1; space: 3mm;' \
  --tabs 'annotation' \
  --source 'tolerance: 15mm' \
  --cuts vcuts \
  --framing 'frame; width: 5mm; space: 3mm;' \
  --tooling '3hole; hoffset: 2.5mm; voffset: 2.5mm; size: 1.5mm' \
  --fiducials '3fid; hoffset: 5mm; voffset: 2.5mm; coppersize: 2mm; opening: 1mm;' \
  --text 'simple; text: owl-driver-board-v1.0; anchor: mt; voffset: 2.5mm; hjustify: center; vjustify: center;' \
  --post 'millradius: 1mm' \
  owl-driver-board.kicad_pcb panel.kicad_pcb
