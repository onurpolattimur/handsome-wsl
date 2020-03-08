sudo apt-get update
sudo apt-get -y install zsh curl git
sudo curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors 
sudo echo "exit" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo bash -c "cat zshrc.settings &>> ~/.zshrc"
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
sudo sed -i 's/# ENABLE_CORRECTION="true"/ENABLE_CORRECTION="true"/g' ~/.zshrc
test="if test -t 1; then\nexec zsh\nfi\n"
sudo echo -e $test >> ~/.bashrc
