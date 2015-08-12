#make_iso.sh is an optional script which uses the Remastersys utility
#to create a bootable ISO from a VM environment.  It only works on VM
#environments, and uses the file /vagrant/data/remastersys.conf to
#configure the ISO parameters.

log=/vagrant/temp/install.log
echo Started make_iso.sh | tee -a $log

echo making iso using Remastersys | tee -a $log
echo trying to scrub remastersys.conf of Windows line-endings | tee -a $log
sudo awk '{ sub("\r$", ""); print }' /vagrant/data/remastersys.conf > /vagrant/temp/remastersys.conf
echo copying remastersys.conf across | tee -a $log
sudo cp /vagrant/temp/remastersys.conf /etc/remastersys.conf

echo setting remastersys boot menu background
sudo cp /vagrant/data/splash.png /etc/remastersys/isolinux/splash.png

sudo remastersys clean

sudo remastersys backup
cp /mnt/temp/remastersys/remastersys/*.iso /vagrant/output/
cp /mnt/temp/remastersys/remastersys/*.log /vagrant/output/
sudo remastersys clean

echo Remastersys completed | tee -a $log

#Once the ISO has been written you can test it using VM software.
#Once it works as intended, consider making it available with a DOI
#using a data repository like Zenodo (http://zenodo.org) or Figshare
#(http://figshare.com)

echo Completed make_iso.sh | tee -a $log