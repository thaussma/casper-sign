#!/usr/bin/env bash

EMAIL="$1"

printf "Signing %s\n" "$EMAIL"
cd /home/casper/casper-testnet-validator-identification || exit
SIGNATURE=$(./sign.py -m "$EMAIL" | tail -n 1)
./verify.py -m "$EMAIL" -s "$SIGNATURE"
