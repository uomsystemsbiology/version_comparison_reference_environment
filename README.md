### Overview

This reference environment executes MATLAB code which is part of a model for activation (phosphorylation) of ERK-MAPK signalling pathway components across the depth of human epidermis.  

It demonstrates that a single piece of code can produce two different results when run with different versions of a programming language, or different supporting libraries.   Running the scripts 'R2012a_example.sh' and 'R2015a_example.sh' side-by-side produces different values for the baseline and amplitude values of Ca^2+ (tissue calcium) and CaM (plasma-membrane calmodulin), even though the underlying MATLAB code is the same.   

The uncompiled MATLAB code  and a detailed explanation of the code and results is in the directory /home/sbl/epidermalerkmapk, and is available online [here](https://sourceforge.net/projects/epidermalerkmapk/files/MATLAB%20Code/) 

This code is part of the manuscript 'Regulation of ERK-MAPK Signalling in Human Epidermis', found here:

		Cursons, J., Gao, J., Hurley, D.G., Print, C.G., Dunbar, P.R, Jacobs, M.D. & Crampin, E.J. (2015).
		Regulation of ERK-MAPK Signalling in Human Epidermis. BMC Systems Biology, 
		DOI: 10.1186/s12918-015-0187-6

You can find a summary of the work on the project page at our website [here](http://uomsystemsbiology.github.io/publications/human-skin-signalling/). 

To find other versions of this reference environment, see Other Links below.  
To learn more about reference environments, [see the detailed description here](http://uomsystemsbiology.github.io/research/reference-environments/).  


### Instructions for use

This version of the reference environment is a virtual machine managed by [Vagrant](http://www.vagrantup.com).  To use it, install [Vagrant](http://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org/), then do:

```
$ git clone https://github.com/uomsystemsbiology/version_comparison_reference_environment.git
$ cd version_comparison_reference_environment
$ vagrant up
$ vagrant reload
```
This will start a virtual machine with scripts to run the MATLAB nonlinear optimisation code using MATLAB R2012a and the MATLAB Compiler v4.17, and MATLAB R2015a and the MATLAB Compiler v6.0.  

### Other links

[Manuscript link](http://dx.doi.org/10.1186/s12918-015-0187-6)

[Project page link](http://uomsystemsbiology.github.io/publications/human-skin-signalling/)

[Bootable ISO](https://dx.doi.org/10.5281/zenodo.31215)

