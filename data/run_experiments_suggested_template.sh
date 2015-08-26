#!/bin/sh

# Set up logfile
log=/home/sbl/run_experiments.log

echo;echo;echo
echo "### Overview
This shell script is part of the reference environment for the manuscript 
['Manuscript Name'](http://manuscript-link.org).  
It executes code to reproduce specific results described in the manuscript.   
You can find more information about this research at the 
[Project page](http://project-link.org).  

To find other versions of this reference environment, see Other Links below.  
To learn more about reference environments, [see the detailed description here](http://reference-environments-link.org).  

### Instructions for use

This shell script reproduces results described in the manuscript and writes 
output to (location).

### Other links

[Manuscript link](http://manuscript-link.org)

[Project page link](http://project-link.org)

[Docker container](https://docker-link.org)

[Bootable ISO](https://iso-link.org)

[Vagrant-managed virtual machine](https://vagrant-link.org)"
echo

echo Completed analysis | tee -a $log
echo;echo
$SHELL