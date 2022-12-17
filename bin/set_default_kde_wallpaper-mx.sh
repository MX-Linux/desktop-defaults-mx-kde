#!/bin/bash
if [ -e "/usr/share/backgrounds/MX_Tangram.png" ]; then
	sleep 5
	qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript 'var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = "org.kde.image";d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");d.writeConfig("Image", "file:///usr/share/backgrounds/MX_Tangram.png")}' 
	if [ "$?" = "0" ]; then 
		cp /etc/xdg/autostart/set_wallpaper.desktop $HOME/.config/autostart/set_wallpaper.desktop
		sed -i s/Hidden=.*/Hidden=true/ $HOME/.config/autostart/set_wallpaper.desktop
	fi
fi
