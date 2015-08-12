#finish.sh contains any commands or tests that must be executed after
#everything else has happened.  Typically it will log that setup has
#completed and that the environment should be rebooted.  It may also
#do some tidy-up of temp directories

log=/vagrant/temp/install.log
echo Started finish.sh | tee -a $log

echo Completed finish.sh | tee -a $log

