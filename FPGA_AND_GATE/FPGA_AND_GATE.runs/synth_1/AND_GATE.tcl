# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Labtools 27-147} -limit 4294967295
create_project -in_memory -part xc7z020clg484-1
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.0 [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
read_vhdl -library xil_defaultlib C:/Zynq_Book/FPGA_AND_GATE/FPGA_AND_GATE.srcs/sources_1/new/AND_GATE.vhd
read_xdc C:/Zynq_Book/FPGA_AND_GATE/FPGA_AND_GATE.srcs/constrs_1/imports/Zynq_Book/zedboard_master.xdc
set_property used_in_implementation false [get_files C:/Zynq_Book/FPGA_AND_GATE/FPGA_AND_GATE.srcs/constrs_1/imports/Zynq_Book/zedboard_master.xdc]

set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Zynq_Book/FPGA_AND_GATE/FPGA_AND_GATE.cache/wt [current_project]
set_property parent.project_dir C:/Zynq_Book/FPGA_AND_GATE [current_project]
catch { write_hwdef -file AND_GATE.hwdef }
synth_design -top AND_GATE -part xc7z020clg484-1
write_checkpoint AND_GATE.dcp
report_utilization -file AND_GATE_utilization_synth.rpt -pb AND_GATE_utilization_synth.pb
