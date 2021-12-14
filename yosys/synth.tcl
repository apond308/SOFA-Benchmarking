set BENCHMARK $::env(test_bench)

yosys read_verilog ../benchmarks/$BENCHMARK/*.v

yosys plugin -i ql-qlf
yosys synth_quicklogic -family qlf_k6n10

yosys write_blif $BENCHMARK.blif