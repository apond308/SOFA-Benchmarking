BUILD_PATH ?= build

VPR8 = $(VPR_PATH)
ARCH = arch/gf12.xml
BLIF_FILE = $(BENCHMARK).blif

ROUTE_CHAN_WIDTH ?= 200
DEVICE ?= --device 32x32
GRAPHIC_SWITCH ?= off

BENCHMARK = vexriscv

# =============================================================================

export test_bench=$(BENCHMARK)

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
	yosys ../yosys/synth.tcl

		
# Create build directories
$(BUILD_PATH):
	mkdir -p $(BUILD_PATH)
	rm $(BUILD_PATH)/*; \
	cd $(BUILD_PATH)


.PHONY: vexriscv 
