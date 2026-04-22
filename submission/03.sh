# Which tx in block 216,351 spends the coinbase output of block 216,128?

block_1=216128
block_2=216351


blockhash_1=$(bitcoin-cli -signet getblockhash $block_1)

blockhash_2=$(bitcoin-cli -signet getblockhash $block_2)

coinbasetx=$(bitcoin-cli -signet getblock $blockhash_1 1 | jq -r '.tx[0]')

bitcoin-cli -signet getblock $blockhash_2 2 | jq -r --arg coinbasetx "$coinbasetx" '.tx[] | select(any(.vin[].txid == $coinbasetx)) | .txid'





