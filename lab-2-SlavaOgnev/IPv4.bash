#!/bin/bash
IP4=$@
mimo=($(echo $IP4 | tr "." " ")) # splitting by points
dec2bin() {
    echo "obase=2; $1" | bc # conversion to binary
}
n=0
for octet in "${mimo[@]}";
do
 n=$((n+1))
 binary=$(dec2bin $octet | xargs printf "%08d")
 if [[ n -eq 4 ]]; then
      echo -n "$binary" # last number
 else
      echo -n "$binary."
     fi

done
echo
