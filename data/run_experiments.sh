#!/bin/sh

#This is a sample shell script which executes a set of commands to run
#some code and generate output.  All the executable commands are 
#commented out.

# Set up logfile
log=/vagrant/temp/run_experiments.log

# Change to project directory
#cd /home/sbl/gawcurcra15/Examples

echo Setting the default graphics toolkit for Octave to gnuplot
#printf "graphics_toolkit gnuplot" >> /home/sbl/.octaverc

echo Executing makefile | tee -a $log
#sleep 2
#./Make 2>&1 | tee -a $log

echo Completed analysis | tee -a $log
