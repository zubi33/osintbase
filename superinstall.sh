#!/bin/bash

# Reset
NoColor='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White


homeconfig=$HOME/.config
nowdir=$(pwd)

clear

echo -e """ $BIWithe $On_IBlue

        ####################################
        #                                  #
        #     Osintbase Installation       #
        #                                  #
        ####################################


Vérifie que tous les programmes nécessaires sont installés :


==> Tappez ENTER !

$NoColor"""
read touche 

sudo pacman -Syu --needed network-manager-applet \
rofi dunst nitrogen arandr lightdm lightdm-gtk-greeter \
thunar gvfs xdg-utils xdotool git rsync \
xorg xorg-xinit xorg-xbacklight xdg-user-dirs chromium picom terminator \
bspwm sxhkd polybar wget gtk-engine-murrine gtk-engines \
yad openssh code exo alsa-utils xdo pulseaudio-alsa \
adobe-source-code-pro-fonts awesome-terminal-fonts cantarell-fonts noto-fonts ttf-dejavu ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common \
thunar-archive-plugin thunar-media-tags-plugin thunar-volman \
volumeicon playerctl neofetch awesome-terminal-fonts xfce4-clipman-plugin \
clamav clamtk mpv feh galculator catfish htop shutter python xarchiver ristretto \
exo garcon tumbler xfce4-appfinder xfce4-panel xfce4-power-manager xfce4-session xfce4-settings \
xfconf xfdesktop xfwm4 xfwm4-themes xfce4-mount-plugin xfce4-netload-plugin xfce4-pulseaudio-plugin \
gnome-themes-extra sassc 

systemctl enable NetworkManager

echo """


Programmes vérifiés et/ou installés.

==> Tappez ENTER !


"""


read touche

echo -e """$BIWithe $UPurple

-------------------------------------------------------------

Installation de paru...$NoColor


"""

# sudo pacman -S --needed base-devel
# git clone https://aur.archlinux.org/paru.git
# cd paru
# makepkg -si
# cd $nowdir
# rm -Rf paru

echo """


Paru installé.

-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche

echo -e """$BIWithe $UPurple

--------------------------------------------------------------

Installation des programmes avec paru.$NoColor


"""

paru -S vim-gruvbox-material-git rofi-power-menu clipmenu-rofi \
thunar-shares-plugin raw-thumbnailer ttf-font-awesome-5 \
pamixer pdfsam zsh qogir-gtk-theme colloid-gtk-theme-git colloid-icon-theme-git \
tor-browser-bin httraqt-git picorypt-git



echo """

Logiciels installés.

-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche

echo -e """$BIWithe $UPurple

-------------------------------------------------------------------

Installé Dorklab $NoColor
"""

cd ~/Documents/
python -m venv Dork
source Dork/bin/activate
cd Dork
git clone https://github.com/rtwillett/DorkLab.git
cd DorkLab
echo "Werkzeug===2.2.2" >> requirements.txt
pip install -r requirements.txt
python -m spacy download en_core_web_lg
deactivate


echo """

Dorklab installé.
-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche

echo -e """$BIWithe $UPurple

-------------------------------------------------------------------

Installe et configure rofi.

Thème rounded-orange-dark conseillé ! $NoColor
"""

cd $nowdir
xdg-user-dirs-update
mkdir -p $HOME/.local/share/rofi/themes/
git clone https://github.com/lr-tech/rofi-themes-collection.git
cp -R rofi-themes-collection/themes/* $HOME/.local/share/rofi/themes/
rm -Rf rofi-themes-collection
rofi-theme-selector

echo """

Rofi configuré.
-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche

echo -e """$BIWithe $UPurple

--------------------------------------------------------------

Blackliste floppy.$NoColor"""

cd $nowdir
sudo bash -c "echo 'blacklist floppy' > /etc/modprobe.d/blacklist-floppy.conf"
cd $nowdir
sudo sed -i 's|FILES=()|FILES=/etc/modprobe.d/blacklist-floppy.conf|g' /etc/mkinitcpio.conf

echo """

Lien vers blacklist-floppy ajouté dans /etc/mkinitcpio.conf

"""


sudo mkinitcpio -p linux

echo """

Floppy blacklisté.
-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche

echo -e """$BIWithe $UPurple

--------------------------------------------------------------

Installation du terminal zsh...$NoColor"""

exit|sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo """

Zsh installé.

-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche



echo -e """$BIWithe $URed

-------------------------------------------------------------

Copie des fichiers utilisateur (home)...

$NoColor"""

cd $nowdir
rsync -aqh home/ ~/

echo """

Fichiers utilisateur copiés.

-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche

echo -e """$BIWithe $URed

-------------------------------------------------------------

Copie des fichiers racine (root)...

$NoColor"""

cd $nowdir
sudo rsync -aqh root/ /

echo """

Fichiers racine copiés.

-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche

echo -e """$BIWithe $UPurple

--------------------------------------------------------------

ZSH comme shell pour l'utilisateur et root.$NoColor"""

# Zsh default shell for user
sudo chsh -s $(which zsh) $USER

# Zsh default shell for root
sudo cp ~/.zshrc /root/
sudo chsh -s $(which zsh) root
sed -i "s|/dev/%y%|%T%|g" ~/.oh-my-zsh/themes/darkblood.zsh-theme
echo """

ZSH as default.
-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche

echo -e """$BIWithe $UPurple

--------------------------------------------------------------

Configuration du theme utilisateur.$NoColor"""

gsettings set org.gnome.desktop.interface gtk-theme Colloid
gsettings set org.gnome.desktop.interface icon-theme Colloid

echo """

Theme configuré.
-------------------------------------------------------------


  ==> Tappez ENTER !

"""

read touche
echo -e """$BIWithe $UBlue

        **************************
        * Installation terminée *
        **************************

L'installation est terminée !

$NoColor

  ==> Tappez ENTER !"""

lightdm --test-mode --debug

read touche

systemctl enable lightdm
systemctl start lightdm 

exit 0
