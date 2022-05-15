@echo off
REM ===========================================================================
REM == COMPILE.BAT
REM ===========================================================================

set MODULE=mips_single_test
set SOURCE=%MODULE%.v

iverilog -g2012 -o %MODULE%.exe %SOURCE%
