# Layout review checklist

## General setup

* [x] [Schematic review](schematic-checklist.md) complete and signed off, including pin swaps done during layout
* [x] CAD design rules configured with fab's minimum tolerances, or better
* [x] 2-3 standard via sizes chosen (signal, power) & well within fab tolerances
* [x] 2-5 standard trace sizes chosen (small signal, small power, main power) & well within fab tolerances
* [x] Align one standard trace size to 50ohm coplanar waveguide/stripline width (if used)
* [x] Zone clearance set appropriately for coplanar waveguides
* [x] Appropriate net clearance set for high-voltage nets
* [x] Cage/shield footprints placed before layout starts

## Decoupling

* [x] Decoupling caps as close to power pins as possible
* [x] Low inductance mounting used for decoupling (prefer ViP if available, otherwise "[]8" shaped side vias
* [x] Large planes filled with stitching vias (5mm grid, or 1/20th wavelength whichever smaller)

## DFM / yield enhancement

* [x] Layout DRC 100% clean
* [x] Controlled impedance, design stackup, thickness, plating and any other parameters recorded in text block on Fab layer
* [x] Confirm impedance calculations include soldermask, or mask removed from RF traces
* [x] Stackup verified with manufacturer and specified in fab notes
* [-] If panelizing, add panel location indicators for identifying location-specific reflow issues
* [x] Layer number markers on each layer copper to ensure correct assembly
* [ ] Fiducials present (on both sides of board) if targeting automated assembly
* [ ] Fiducial pattern asymmetric to detect rotated or flipped boards
* [ ] Soldermask/copper clearance on fiducials respected
* [ ] Panelization specified if required

## Footprints

* [ ] Confirm components are in stock in the selected package
* [x] Confirm components (especially connectors and power regulators) are capable of desired current in the selected package
* [x] Verify schematic symbol matches the selected package (confirm datasheet pins vs PCB copper wiring)
* [x] Confirm pinout diagram is from top vs bottom of package
* [x] 3D models obtained (if available); board reviewed in 3D to check for courtyard/assembly issues
* [x] Soldermask apertures on all SMT lands and PTH pads
* [x] Soldermask fingers between all IC pads

## Differential pairs
* [-] Routed differentially
* [-] Skew matched
* [-] Correct clearance to non-coupled nets

## High-speed signals

* [x] Sufficient clearance to potential aggressors
* [x] Length matched if required
* [x] Minimize crossing reference plane splits/slots or changing layers, use caps/stitching vias if unavoidable
* [-] Confirm fab can do copper to edge of PCB for edge launch connectors
* [-] Double-check pad width on connectors and add ground plane cutouts if needed to minimize impedance discontinuities
* [-] Add stitching vias to ground plane in large top layer ground pads (SMA etc) to avoid resonances

## Power
* [x] Power planes are not broken by closely-spaced fence vias
* [x] Unbroken ground planes beneath all high-current traces
* [x] Sufficient width for planes/traces for required current
* [x] High voltage - minimum clearance sufficient between all points

## RF
* [-] High-power outputs well separated from LNA inputs
* [-] LNA inputs clear of all other active components
* [-] Keepout under LNA section - no traces or active components on other layers
* [-] Large clearance around magnetic components (eg. circulators)
* [-] RF traces smooth/rounded
* [-] Differential RF pairs have 100ohm impedance, not 50

## Sensitive analog
* [-] All sensitive components under cages/shields
* [-] Physically separated from high current SMPS or other noise sources
* [-] Consider microphone effect on MLCCs if near strong sound sources
* [-] Power ground return does not cross under sensitive sections

## Mechanical
* [x] Confirm all connectors to other systems comply with the appropriate mechanical standard (connector orientation, key position, etc)
* [x] LEDs, buttons, and other UI elements on outward-facing side of board
* [x] Keep-outs around PCB perimeter, card guides, panelization mouse-bites, etc respected
* [x] Stress-sensitive components (MLCC) sufficiently clear from V-score or mouse bite locations, and oriented to reduce
bending stress
* [-] Clearance around large ICs for heatsinks/fans if required
* [x] Clearance around pluggable connectors for mating cable/connector
* [x] Clearance around mounting holes for screws
* [x] Plane keepouts and clearance provided for shielded connectors, magnetics, etc
* [ ] Confirm PCB dimensions and mounting hole size/placement against enclosure or card rack design
* [x] Verify mounting hole connection/isolation
* [x] Components not physically overlapping/colliding
* [-] Clearance provided around solder-in test points for probe tips

## Thermal

* [x] Thermal reliefs used for plane connections (unless via is used for heatsinking)
* [x] Solid connections used to planes if heatsinking
* [x] Ensure thermal balance on SMT chip components to minimize risk of tombstoning

## Solder paste

* [x] No uncapped vias in pads (except low-power QFNs where some voiding is acceptable)
* [x] QFN paste prints segmented
* [x] Small pads 100% size, larger pads reduced to avoid excessive solder volume
* [x] No paste apertures on card edge connectors or test points

## Solder mask

* [x] Adequate clearance around pads (typ. 50 um)
* [x] Fingers between pads on small-pitch components

## Silkscreen

* [x] Text size within fab limits & consistent across board
* [x] Text not overlapping drills or component pads
* [x] Text orientation consistent (within reason)
* [x] Text removed entirely in, or moved outside of, high component/via density areas
* [x] Unnecessary silkscreen removed for clarity
* [x] Power connector polarity marked and verified
* [x] LED colour marked (if hand assembly)
* [x] LED/switch/connector purpose marked
* [x] Spare GPIO headers marked with port name
* [x] Design/assembly notes included where space permits (antenna dimensions/centre frequency, wiring notes, baud speed, assembly instructions/screw size)
* [x] High voltage/heat/ESD safety warnings included (if appropriate)
* [x] Link to project github included (open hardware designs)
* [x] Traceability markings (revision, date, name, etc) provided and updated
* [x] Silkscreen box provided for writing/sticking serial number
* [x] Text mirrored properly on bottom layer
* [-] Test points labeled if space permits

## Flex specific
* [-] Components oriented to reduce bending forces
* [-] Teardrops on all wire-to-pad connections

## CAM production
* [-] Check impedance-matched width against final fab stackup
* [x] KiCAD specific: rerun DRC and zone fills before exporting CAM files to ensure proper results
* [x] Export gerber/drill files at the same time to ensure consistency
* [x] Visually verify final CAM files to ensure no obvious misalignments
