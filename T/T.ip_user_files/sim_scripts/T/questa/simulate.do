onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib T_opt

do {wave.do}

view wave
view structure
view signals

do {T.udo}

run -all

quit -force
