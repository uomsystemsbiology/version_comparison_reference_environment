#finish.sh contains any commands or tests that must be executed after
#everything else has happened.  Typically it will log that setup has
#completed and that the environment should be rebooted.  It may also
#do some tidy-up of temp directories

log=/vagrant/temp/install.log

echo Completed reference environment setup | tee -a $log
echo Run ''vagrant reload'' to make the environment ready for use | tee -a $log

