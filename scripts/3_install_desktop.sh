#install_desktop.sh installs packages specifically for environments
#which have a desktop.  Configuration usually happens later in 
#configure_desktop.sh unless something depends on it here.

log=/vagrant/temp/install.log
echo Started install_desktop.sh | tee -a $log

echo Installing Arial font | tee -a $log
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get -y install msttcorefonts
sudo fc-cache -f -v

echo Completed install_desktop.sh | tee -a $log