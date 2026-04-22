# How many new outputs were created by block 243,825?

block=243825

blockhash=$(bitcoin-cli -signet getblockhash $block)

bitcoin-cli -signet getblock $blockhash 2  | jq -r '[.tx[].vout[]] | length'



