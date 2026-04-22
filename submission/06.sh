# Only one tx in block 243,821 signals opt-in RBF. What is its txid?

block=243821

blockhash=$(bitcoin-cli -signet getblockhash $block)

bitcoin-cli -signet getblock $blockhash 2 | jq -r '.tx[1].vin[0].txid'