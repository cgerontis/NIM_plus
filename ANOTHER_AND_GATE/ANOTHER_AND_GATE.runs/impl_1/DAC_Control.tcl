proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Labtools 27-147} -limit 4294967295

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7z020clg484-1
  set_property board_part em.avnet.com:zed:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir C:/Zynq_Book/ANOTHER_AND_GATE/ANOTHER_AND_GATE.cache/wt [current_project]
  set_property parent.project_dir C:/Zynq_Book/ANOTHER_AND_GATE [current_project]
  add_files -quiet C:/Zynq_Book/ANOTHER_AND_GATE/ANOTHER_AND_GATE.runs/synth_1/DAC_Control.dcp
  read_xdc C:/Zynq_Book/ANOTHER_AND_GATE/ANOTHER_AND_GATE.srcs/constrs_1/imports/Zynq_Book/zedboard_master.xdc
  link_design -top DAC_Control -part xc7z020clg484-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  catch {update_ip_catalog -quiet -current_ip_cache {c:/Zynq_Book/ANOTHER_AND_GATE/ANOTHER_AND_GATE.cache} }
  opt_design 
  write_checkpoint -force DAC_Control_opt.dcp
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force DAC_Control_placed.dcp
  catch { report_io -file DAC_Control_io_placed.rpt }
  catch { report_clock_utilization -file DAC_Control_clock_utilization_placed.rpt }
  catch { report_utilization -file DAC_Control_utilization_placed.rpt -pb DAC_Control_utilization_placed.pb }
  catch { report_control_sets -verbose -file DAC_Control_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force DAC_Control_routed.dcp
  catch { report_drc -file DAC_Control_drc_routed.rpt -pb DAC_Control_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -file DAC_Control_timing_summary_routed.rpt -pb DAC_Control_timing_summary_routed.pb }
  catch { report_power -file DAC_Control_power_routed.rpt -pb DAC_Control_power_summary_routed.pb }
  catch { report_route_status -file DAC_Control_route_status.rpt -pb DAC_Control_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  write_bitstream -force DAC_Control.bit 
  if { [file exists C:/Zynq_Book/ANOTHER_AND_GATE/ANOTHER_AND_GATE.runs/synth_1/DAC_Control.hwdef] } {
    catch { write_sysdef -hwdef C:/Zynq_Book/ANOTHER_AND_GATE/ANOTHER_AND_GATE.runs/synth_1/DAC_Control.hwdef -bitfile DAC_Control.bit -meminfo DAC_Control_bd.bmm -file DAC_Control.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

