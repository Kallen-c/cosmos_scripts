#Create directory

sudo mkdir $HOME/txs

#Download script

sudo curl -s https://raw.githubusercontent.com/Aleksandr7793/cosmos_scripts/main/txs_spam/txs.sh > $HOME/txs/txs_spam.sh && sudo chmod +x $HOME/txs/txs_spam.sh

#Edit script

sudo nano $HOME/txs/txs_spam.sh

#Install screen

sudo apt install screen

#Create screen session

screen -S txs_spam

#Start spam txs

cd $HOME/txs && ./txs_spam.sh
