#!/bin/bash

service="" # example cohod
denom="" # example ucoho
WALLET="" # wallet name
keyring_flag="" # example --keyring-backend test
ADDR=$(${service} keys show $WALLET -a ${keyring_flag} --bech acc)
chain="" # example darkmatter-1
memo="" # example Stake-Take
SEC=0

for (( i=$SEC;i<=((SEC+1000000));i++ ))
do
 ${service} tx bank send $ADDR $ADDR 1${denom} --note ${memo} ${keyring_flag} --chain-id $chain -y -s${i}
done
