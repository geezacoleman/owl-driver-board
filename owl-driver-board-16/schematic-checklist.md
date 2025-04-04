# Schematic review checklist

## General

* [x] CAD ERC 100% clean. If some errors are invalid due to toolchain quirks, each exception must be inspected and signed
off as invalid.
* [x] Verify pin numbers of all schematic symbols against datasheet or external interface specification document (if not yet board proven).
* [x] Schematic symbol matches chosen component footprint
* [-] Thermal pads are connected to correct power rail (may not always be ground)
* [-] Debug interfaces are not power gated in sleep mode

## Passive components
* [x] Power/voltage/tolerance ratings specified as required
* [x] Ceramic capacitors appropriately de-rated for C/V curve
* [x] Polarized components specified in schematic if using electrolytic caps etc
* [x] Filters: component footprint is large enough for rated current, and appropriate for RF characteristics
* [x] Different component values minimised/combined where possible
* [x] Parts selected for every schematic symbol
* [x] "Basic" parts selected for passives where possible

## Power supply

### System power input

* [x] Reverse voltage protection at system power inlet
* [x] Fusing at system power inlet
* [-] EMI common mode/low-pass filtering at power inlet (if needed)
* [-] Check total input capacitance and add inrush limiter (if needed)
* [-] Low pass filter included after main buck regulator (if needed)

### Regulators

* [-] Under/overvoltage protection configured correctly if used
* [-] Verify estimated power usage per rail against regulator rating
* [-] Current-sense resistors on power rails after regulator output caps, not in switching loop
* [-] Remote sense used on low voltage or high current rails
* [-] Linear regulators and voltage reference ICs are stable with selected output cap ESR
* [-] Confirm regulator strap pin configuration against datasheet (check for voltage offset)
* [-] Confirm power rail sequencing against device datasheets (if needed)

### Decoupling
* [x] Decoupling present for all ICs
* [x] Decoupling meets/exceeds vendor recommendations if specified
* [x] Bulk decoupling present at buck/boost regulators (input and output)
* [-] RF boards: standard 0402 decoupling cap selected for frequency of interest and used at every IC

### General
* [-] All power inputs fed by correct voltage
* [-] Analog rails filtered/isolated from digital circuitry as needed
* [-] LNAs, input opamps on dedicated power rails

## Signals

### Digital

* [-] Signals are correct logic level for input pin
* [-] Pullups on all open-drain outputs
* [x] TX/RX wired correctly for UART, SPI, MGT, etc
* [x] Enable pins: Active high/low polarity correct
* [x] EXTI and/or timer pins used for UI elements (buttons, rotary encoders)
* [-] STM32: special pin functions confirmed and allocated in Eclipse
* [-] STM32: check software pullups/pulldowns are available on pins that need it (I2C)

### Analog/RF

* [-] DC blocking cap before all amplifiers, and on all inputs/outputs
* [-] Amplifier bias inductors + filter inductors do not short power rail to ground
* [-] Gas discharge protection on all RF inputs/outputs
* [-] RC time constant for attenuators sane given ADC sampling frequency
* [-] Verify frequency response of RF components across entire operating range. Don't assume a "1-100 MHz" amplifier has the
same gain across the whole range.
* [-] Verify polarity of op-amp feedback
* [-] Cages/shields selected for each schematic block

### Clocks

* [-] All oscillators meet required jitter / frequency tolerance. Be extra cautious with MEMS oscillators as these tend to have higher jitter.
* [-] Correct load caps provided for discrete crystals
* [-] Crystals only used if IC has an integrated crystal driver

### Strap/init pins
* [-] Pullup/pulldowns on all signals that need defined state at boot
* [-] Strap pins connected to correct rail for desired state
* [-] JTAG/ICSP connector provided for all programmable devices
* [-] Config/boot flash provided for all FPGAs or MPUs without internal flash

### External interface protection

* [-] Power outputs (USB etc) current limited
* [-] ESD protection on data lines going off board

### Debugging / reworkability

* [-] Use 0-ohm resistors/solder jumpers vs direct hard-wiring for strap pins when possible
* [-] Provide multiple ground clips/points for scope probes
* [-] Multimeter + U.FL test points on all power rails
* [-] Test points on interesting signals which may need probing for bringup/debug
* [-] Dedicated ground in close proximity to test points
* [-] LED on every power rail
* [-] Several spare GPIOs broken out, unless board completely characterised

## Thermal

* [ ] Power estimates for all large / high power ICs
* [ ] Thermal calculations for all large / high power ICs
* [ ] Specify heatsinks as needed

