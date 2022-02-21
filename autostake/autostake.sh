#!/bin/bash
GREEN_COLOR='\033[0;32m'
RED_COLOR='\033[0;31m'
WITHOU_COLOR='\033[0m'
wallet=""  # name of wallet
service="" # example cohod
keyring="" # keyring flag, example --keyring-backend test
DEL_ADDR=$(${service} keys show $wallet -a --bech acc ${keyring})
VAL_ADDR=$(${service} keys show $wallet -a --bech val ${keyring})
PWD='PWD' # password
DELAY=300 # pause in sec
chain="" # example darkmatter-1
denom="" # example ucoho
gasfees="" # gas, fees flags example --gas auto --fees 200${denom}
for (( ;; )); do
        echo -e "Get reward from Delegation"
        echo -e "${PWD}\ny\n" | ${service} tx distribution withdraw-rewards ${VAL_ADDR} --chain-id ${chain} --from $wallet  --commission ${keyring} ${gasfees} -y
for (( timer=20; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOUT_COLOR} sec\r" $timer
                sleep 1
        done
BAL=$(${service} q bank balances ${DEL_ADDR} -o json | jq -r '.balances | .[].amount')
echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} ${DENOM}\n"
        echo -e "Claim rewards\n"
        echo -e "${PWD}\n${PWD}\n" | ${service} tx distribution withdraw-all-rewards --from $wallet --chain-id ${chain} ${gasfees} ${keyring} -y
for (( timer=20; timer>0; timer-- ))
        do
                printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
                sleep 1
        done
BAL=$(${service} q bank balances ${DEL_ADDR} -o json | jq -r '.balances | .[].amount');
        BAL=$(($BAL - 1000))
echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} ${denom}\n"
        echo -e "Stake ALL\n"
if (( BAL > 1000 )); then
            echo -e "${PWD}\n${PWD}\n" | ${service} tx staking delegate ${VAL_ADDR} ${BAL}${denom} --from $wallet --chain-id ${chain} ${keyring} ${gasfees} -y
        else
                                echo -e "BALANCE: ${GREEN_COLOR}${BAL}${WITHOU_COLOR} ${denom} BAL < 1000 ((((\n"
        fi
for (( timer=$DELAY; timer>0; timer-- ))
        do
            printf "* sleep for ${RED_COLOR}%02d${WITHOU_COLOR} sec\r" $timer
            sleep 1
        done
done
