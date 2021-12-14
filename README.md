# SOFA-Benchmarking

This repository holds the files used for SOFA benchmarking. It uses yosys and VPR to run a benchmark on a test VPR architecture.

### Setup
To start, make sure to set your YOSYS_PATH environment variable as well as the VPR_PATH environment variable. Make sure YOSYS and VPR are installed.

### Usage
To run a benchmark, use 'make' to run the complete process. If you want to only run yosys or VPR, use 'make yosys' or 'make vpr'.
