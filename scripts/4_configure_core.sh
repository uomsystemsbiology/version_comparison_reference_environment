#configure_core.sh sets up applications, compiles code and puts scripts
#in the appropriate places.  It runs after all the installation commands
#have completed

log=/vagrant/temp/install.log
echo Started configure_core.sh | tee -a $log

echo Setting up MATLAB Runtime install files | tee -a $log
unzip -q MCR_R2015a_glnxa64_installer.zip -d MCR_R2015a_glnxa64_installer
sudo ./MCR_R2015a_glnxa64_installer/install -mode silent -agreeToLicense yes

unzip -q MCR_R2012a_glnxa64_installer.zip -d MCR_R2012a_glnxa64_installer
sudo ./MCR_R2012a_glnxa64_installer/install -mode silent -agreeToLicense yes

echo Deleting the MATLAB Runtime install files | tee -a $log
rm ~/MCR_R2015a_glnxa64_installer.zip
rm -rf ~/MCR_R2015a_glnxa64_installer

rm ~/MCR_R2012a_glnxa64_installer.zip
rm -rf ~/MCR_R2012a_glnxa64_installer

echo Adding MATLAB Runtime library paths | tee -a $log
	printf "/usr/local/MATLAB/MATLAB_Runtime/v85/runtime/glnxa64\n/usr/local/MATLAB/MATLAB_Runtime/v85/bin/glnxa64\n/usr/local/MATLAB/MATLAB_Runtime/v85/sys/os/glnxa64\n" | sudo tee /etc/ld.so.conf.d/matlab_runtime_R2015a.conf
	printf "/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/runtime/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/bin/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/sys/os/glnxa64:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/sys/java/jre/glnxa64/jre/lib/amd64/native_threads:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/sys/java/jre/glnxa64/jre/lib/amd64/server:/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/sys/java/jre/glnxa64/jre/lib/amd64\n" | sudo tee /etc/ld.so.conf.d/matlab_runtime_R2012a.conf
	printf '\nexport XAPPLRESDIR=/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/X11/app-defaults\n' >> ~/.bashrc
	printf '\nexport XAPPLRESDIR=/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/X11/app-defaults\n' >> ~/.profile
	export XAPPLRESDIR=/usr/local/MATLAB/MATLAB_Compiler_Runtime/v717/X11/app-defaults

echo Copying login message to /etc/motd | tee -a $log
sudo cp /vagrant/temp/data/motd /etc/motd

echo Copying build info to home directory | tee -a $log
sudo cp /vagrant/temp/build_info.txt /home/sbl/build_info.txt

echo Copying code to home directory | tee -a $log
cp -R /vagrant/temp/data/compiled_R2012a /home/sbl/R2012a_code
cp -R /vagrant/temp/data/compiled_R2015a /home/sbl/R2015a_code

echo Copying shell scripts to home directory | tee -a $log
sudo cp /vagrant/temp/data/R2012a_example.sh /home/sbl/R2012a_example.sh
sudo chmod 777 /home/sbl/R2012a_example.sh

sudo cp /vagrant/temp/data/R2015a_example.sh /home/sbl/R2015a_example.sh
sudo chmod 777 /home/sbl/R2015a_example.sh

echo Linking the shell script into the root folder | tee -a $log
sudo ln -sv /home/sbl/R2015a_example.sh /R2015a_example.sh
sudo ln -sv /home/sbl/R2012a_example.sh /R2012a_example.sh

echo Completed configure_core.sh | tee -a $log