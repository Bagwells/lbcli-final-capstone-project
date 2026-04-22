# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

tx=b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

rawtx=$(bitcoin-cli -signet getrawtransaction $tx)
decodedtx=$(bitcoin-cli -signet decoderawtransaction $rawtx)

prev_txid=$(echo $decodedtx | jq -r '.vin[0].txid')
prev_vout=$(echo $decodedtx | jq -r '.vin[0].vout') 

in_btc=$(bitcoin-cli -signet getrawtransaction "$prev_txid" 1 | jq -r ".vout[$prev_vout].value")

out_btc=$(echo $decodedtx | jq -r '[.vout[].value] | add')


fee_satoshi=$(awk -v in="$in_btc" -v out="$out_btc" 'BEGIN { printf "%.0f\n", (in-out)*100000000 }')
echo "$fee_satoshi"
