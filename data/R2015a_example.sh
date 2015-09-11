#!/bin/sh

# Set up logfile
log=/home/sbl/run_experiments.log

echo;echo;echo
echo "### Overview
This shell script executes MATLAB code which is part of a model for activation (phosphorylation) of ERK-MAPK signalling pathway components across the depth of human epidermis.  This version of the code was compiled with MATLAB v8.5.0.197613 (R2015a) and the MATLAB Compiler v6.0.  

This reference environment demonstrates that a single piece of code can produce two different results when run with different versions of a programming language, or different supporting libraries.   Running this script and the script 'R2012a_example.sh' side-by-side produces different values for the baseline and amplitude values of Ca^2+ (tissue calcium) and CaM (plasma-mebrane calmodulin), even though the underlying MATLAB code is the same.     

The complete version of the code is part of the manuscript 'Regulation of ERK-MAPK Signalling in Human Epidermis', found here:

		Cursons, J., Gao, J., Hurley, D.G., Print, C.G., Dunbar, P.R, Jacobs, M.D. & Crampin, E.J. (2015).
		Regulation of ERK-MAPK Signalling in Human Epidermis. BMC Systems Biology, 
		DOI: 10.1186/s12918-015-0187-6

You can find a summary of the work on the project page at our website [here](http://uomsystemsbiology.github.io/publications/human-skin-signalling/)

To find other versions of this reference environment, see Other Links below.  
To learn more about reference environments, [see the detailed description here](http://uomsystemsbiology.github.io/research/reference-environments/).  

### Other links

[Manuscript link](http://dx.doi.org/10.1186/s12918-015-0187-6)

[Project page link](http://uomsystemsbiology.github.io/publications/human-skin-signalling/)

[Docker container](https://docker-link.org)

[Bootable ISO](https://iso-link.org)

[Vagrant-managed virtual machine](https://vagrant-link.org)"
echo

echo -en "\033]0;Compiled with MATLAB R2015a\a"
/home/sbl/R2015a_code/run_optimp.sh /usr/local/MATLAB/MATLAB_Runtime/v85/

echo Completed analysis | tee -a $log
echo;echo
$SHELL