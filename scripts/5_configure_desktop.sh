#configure_desktop.sh does setup and configuration for 
#things which only apply to environments with desktops.

log=/vagrant/temp/install.log
echo Started configure_desktop.sh | tee -a $log

echo Annotating wallpaper image with text | tee -a $log
sudo cp /vagrant/temp/data/reference_environment_wallpaper_1024x768.png /vagrant/temp/temp_wallpaper.png
sudo convert -font Arial-Bold -fill white -pointsize 48 -annotate +25+100 '@/vagrant/temp/data/background_title.txt' /vagrant/temp/temp_wallpaper.png /vagrant/temp/temp_wallpaper.png 2>&1 | tee -a $log
sudo convert -font Arial-Bold-Italic -fill white -pointsize 32 -annotate +25+200 '@/vagrant/temp/data/project_title.txt' /vagrant/temp/temp_wallpaper.png /vagrant/temp/temp_wallpaper.png 2>&1 | tee -a $log
sudo convert -font Arial-Regular -fill white -pointsize 22 -annotate +25+300 '@/vagrant/temp/data/background_text.txt'  /vagrant/temp/temp_wallpaper.png /vagrant/temp/temp_wallpaper.png 2>&1 | tee -a $log
sudo convert -font Arial-Bold -fill white -style Italic -weight Bold -pointsize 16 -annotate +25+650 '@/vagrant/temp/build_info.txt' /vagrant/temp/temp_wallpaper.png /vagrant/temp/temp_wallpaper.png 2>&1 | tee -a $log

echo Copying wallpaper across | tee -a $log
sudo cp /vagrant/temp/temp_wallpaper.png /usr/share/lubuntu/wallpapers/reference_environment_wallpaper_1024x768.png

echo Setting wallpaper | tee -a $log
WALLPAPERPATH=/usr/share/lubuntu/wallpapers/reference_environment_wallpaper_1024x768.png
sudo sed -i "s#\(wallpaper *= *\).*#\1$WALLPAPERPATH#" /home/sbl/.config/pcmanfm/lubuntu/desktop-items-0.conf
sudo sed -i "s#\(wallpaper_mode *= *\).*#\1fit#" /home/sbl/.config/pcmanfm/lubuntu/desktop-items-0.conf
sudo sed -i "s#\(desktop_bg *= *\).*#\1\#00447b#" /home/sbl/.config/pcmanfm/lubuntu/desktop-items-0.conf

echo Creating link from shell script on desktop| tee -a $log
ln -sv /home/sbl/R2012a_example.sh /home/sbl/Desktop/R2012a_example.sh
printf "[R2012a_example.sh]\nx=10\ny=500\n" >> /home/sbl/.config/pcmanfm/lubuntu/desktop-items-0.conf
ln -sv /home/sbl/R2015a_example.sh /home/sbl/Desktop/R2015a_example.sh
printf "[R2015a_example.sh]\nx=110\ny=500\n" >> /home/sbl/.config/pcmanfm/lubuntu/desktop-items-0.conf

echo Removing Trash icon from the desktop
sudo sed -i "s#\(show_trash *= *\).*#\10#" /home/sbl/.config/pcmanfm/lubuntu/desktop-items-0.conf

echo Setting resolution to 1024x768
printf "xrandr --output VBOX0 --mode 1024x768" >> /home/sbl/.config/lxsession/Lubuntu/autostart
sudo chmod 755 /home/sbl/.config/lxsession/Lubuntu/autostart

echo Editing terminal settings so that desktop and menu icons work properly| tee -a $log
TERMINALSTRING="uxterm -e %s"
sudo sed -i "s#\(terminal *= *\).*#\1$TERMINALSTRING#" /home/sbl/.config/libfm/libfm.conf
printf "[Command]\nTerminal=uxterm -e %%s" > /home/sbl/.config/lxpanel/Lubuntu/config

echo Completed configure_desktop.sh | tee -a $log