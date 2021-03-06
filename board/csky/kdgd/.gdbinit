# Set the JTAG address according to C-SKY debugserver settings
tar jtag jtag://192.168.0.88:1025

# CPU cache settings
set $cr18=0x7d

# enable prefetch (bit 8) and preload (bit 2)
set $cr31 = (1 << 8) | (1 << 2)

# Pass a magic number to Linux kernel for validation.
set $r0 = 0x20150401

# Pass the devicetree blob(dtb) store address to Linux kernel
set $r1 = 0x8F000000

# Store the devicetree blob(dtb) file to the store address above
restore output/images/kdgd.dtb binary 0x8F000000

# flush cache
set $cr17 = 0x33

# Load the debugging elf file
load

