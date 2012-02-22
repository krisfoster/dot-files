#!/bin/bash
sudo apt-get install aptitude

echo "Installing usefull software..."
sudo aptitude install menu
sudo aptitude install vim gvim
sudo aptitude install emacs
sudo aptitude install git

# Use this to wrap around calls to sqlplus
sudo aptitude install rlwrap
sudo aptitude install curl wget lynx
sudo aptitude install texlive-latex-base texlive-latex-base-doc texlive-latex-extra texlive-latex-extra-doc texlive-latex-recommended texlive-latex-recommended-doc texlive-latex3
sudo aptitude install dos2unix
sudo aptitude install nrss

# Test to see if java is installed
type -P javac &>/dev/null || { echo "I require javac but it's not installed.  Aborting." >&2; exit 1; }
sudo aptitude install maven2
if [ -d ~/bin ]
then
    cd ~/bin
    echo "Fetching and installing leiningen..."
    wget http://github.com/technomancy/leiningen/raw/stable/bin/lein
    chmod +x lein
    lein self-install
    cd -
fi

# Install spotify
grep -iq spotify /etc/apt/sources.list
if [ "$?" -ne "0" ]
then
    echo "Installing Spotify..."
    sudo echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E
    sudo apt-get update
    sudo apt-get install spotify-client-qt spotify-client-gnome-support
fi
type -P spotify &>/dev/null || { sudo apt-get install spotify-client-qt spotify-client-gnome-support; }

# Heoku stuff
apt-add-repository 'deb http://toolbelt.herokuapp.com/ubuntu ./'
curl http://toolbelt.herokuapp.com/apt/release.key | apt-key add -
apt-get update
apt-get install heroku-toolbelt

echo "Installing google software..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo aptitude install google-chrome-beta googlecl
echo "Installing alternative window managers..."
echo ""
echo "Done :)"
