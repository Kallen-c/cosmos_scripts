#Create directory

sudo mkdir $HOME/autostake

#Download script

sudo curl -s https://raw.githubusercontent.com/Aleksandr7793/cosmos_scripts/main/autostake/autostake.sh > $HOME/autostake/autostake.sh && sudo chmod +x $HOME/autostake/autostake.sh

#Edit script

sudo nano $HOME/autostake/autostake.sh

#save

control+o control+x

#Install screen

sudo apt install screen

#Create screen session

screen -S autostake

#Start autostake

cd $HOME/autostake && ./autostake.sh
