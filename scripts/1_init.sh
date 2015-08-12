#init.sh contains any commands or tests that must be executed before
#anything else happens.  Typically it just logs startup and makes
#a temporary directory for transferring files

log=/vagrant/temp/install.log

echo Starting reference environment setup | tee -a $log
echo Started init.sh | tee -a $log
sudo mkdir /vagrant/temp -p

echo Completed init.sh | tee -a $log