BUILD_PATH ?= build

# Set your VPR path
VPR8 = $(VPR_PATH)
# VPR arch file
ARCH = arch/gf12.xml
# Yosys output blif file name
BLIF_FILE = $(BENCHMARK).blif

ROUTE_CHAN_WIDTH ?= 200
DEVICE ?= --device 32x32
# VPR graphics enable
GRAPHIC_SWITCH ?= off

# Select the active benchmark
BENCHMARK = vexriscv
# Select the active synthesis script in the 'yosys' directory
SYNTH_SCRIPT = synth_quicklogic

# =============================================================================

export test_bench=$(BENCHMARK)

# 'make full' runs both yosys and VPR
full: yosys vpr

vpr:
	cd $(BUILD_PATH); \
	$(VPR8) ../$(ARCH) \
		$(BLIF_FILE) \
		--route_chan_width $(ROUTE_CHAN_WIDTH) \
		$(DEVICE) \
		--disp $(GRAPHIC_SWITCH)

yosys: $(BUILD_PATH)
	cd $(BUILD_PATH); \
	yosys ../yosys/$(SYNTH_SCRIPT).tcl

		
# Create build directories
$(BUILD_PATH):
	mkdir -p $(BUILD_PATH); \
	rm -rf $(BUILD_PATH)/*


.PHONY: clean
clean:
	rm -rf $(BUILD_PATH)