# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# This is a sample Vagrantfile for a reference environment.  It has a 
# standard set of scripts to install packages, get code and set things 
# up.  You can edit this Vagrantfile if you need to, but most configuration
# for specific projects can probably done just by editing the scripts in
# /scripts.

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# Every Vagrant virtual environment requires a box to build off of.
# Commented out because we are setting this for each provider
#config.vm.box = "sbl_virtualbox"

#Define some variables to handle specific behaviours
	is_docker  = (!ARGV.nil? && ARGV.join('').include?('--provider=docker'))
	is_aws  = (!ARGV.nil? && ARGV.join('').include?('--provider=aws'))
	is_virtualbox  = (ARGV[0]="up" && !ARGV.join('').include?('--provider'))
	has_desktop = is_aws || is_virtualbox
	module OS
		def OS.windows?
			(/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
		end
	end

#Terminate on attempt to use Docker to back a Vagrant environment on Windows
#because currently it's not very reliable.  Comment this out if you want to try it.
if OS.windows? && is_docker
    abort "Vagrant on Windows backing a Docker reference environment is unreliable\nso this is currently disabled. Aborting."
end

  
# Provider details
config.vm.provider "virtualbox" do |vb,override|
	vb.gui = true
	override.vm.box = "uomsystemsbiology/base-vbox"
end

config.vm.provider "docker" do |docker,override|
    	docker.image = "uomsystemsbiology/base-docker"
    	docker.cmd = ["/sbin/my_init", "--enable-insecure-key"]
    	docker.has_ssh = true
    	docker.name = "reference_environment_template"
    	override.vm.synced_folder ".", "/vagrant", disabled: true
end

config.vm.provider "aws" do |aws,override|
	override.vm.box = "uomsystemsbiology/base-aws"
	override.vm.synced_folder ".", "/vagrant", disabled: true
	aws.ami = "dummy"
	aws.region = "us-west-2"
	aws.instance_type = "t2.micro"
        aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
	aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
	aws.security_groups = "launch-wizard-5"
end

#Connection details
	config.ssh.username = "sbl"
	config.ssh.password = "sbl"
	config.ssh.insert_key = false
	
#Copying the contents of /data to a temporary directory on the environment
	config.vm.provision "shell", inline: "sudo rm -rf /vagrant/temp;sudo mkdir /vagrant/temp -p;chmod 777 /vagrant/temp"
	config.vm.provision "file", source: "data", destination: "/vagrant/temp"

#Provisioning the environment	
	config.vm.provision "shell", path: "scripts/1_init.sh", privileged: false
	config.vm.provision "shell", path: "scripts/2_install_core.sh", privileged: false
	
	if (has_desktop)
		config.vm.provision "shell", path: "scripts/3_install_desktop.sh", privileged: false
	end	
	
	config.vm.provision "shell", path: "scripts/4_configure_core.sh", privileged: false
	
	if (has_desktop)
		config.vm.provision "shell", path: "scripts/5_configure_desktop.sh", privileged: false
	end
	
	config.vm.provision "shell", path: "scripts/6_finish.sh", privileged: false	

#Instructions for starting the environment, by environment type
	if (is_aws)
		config.vm.post_up_message = "Reference environment setup complete for AWS\nRun \'vagrant rdp -- /w:1024 /h:768\' to make an RDP connection to the environment\n RDP password is \'sbl\'\nOr ssh in using the IP in your AWS Console."
	elsif (is_virtualbox)
		config.vm.post_up_message = "Reference environment setup complete for VirtualBox\nRun \'vagrant reload\' to reboot the environment after first setup \nand make it ready for use."	 
	elsif (is_docker)
		config.vm.post_up_message = "Reference environment setup complete for Docker\nRun \'vagrant ssh\' to connect to the reference environment\n"
	else
		config.vm.post_up_message = "Environment type not detected."
	end
	
	
# Uncomment the lines below to make an ISO using remastersys and the remastersys.conf file	
#	if (is_virtualbox)
#	config.vm.provision "shell", path: "scripts/make_iso.sh", privileged: false
#	end

end
