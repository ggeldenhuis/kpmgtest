#!/bin/bash
if [ "$1" -eq "0" ]; then
 echo 'Please provide a key for the metadata you want to look up, eg: network/interfaces/macs'
  exit 1
fi

KEY=${1}
VALUE=$(curl --silent http://169.254.169.254/latest/meta-data/${KEY})

RESULTSTRING='{'
COUNT=0
for keyitem in $(echo $KEY | sed "s/\// /g"); do
  RESULTSTRING+="\"${keyitem}\":{"
  ((COUNT=COUNT+1))
done

EXPANDEDVALUES=''
valuecount=0
for keyvalue in $VALUE; do
  EXPANDEDVALUES+="\"${keyvalue}\": {},"
  ((valuecount=valuecount+1))
done
EXPANDEDVALUES=${EXPANDEDVALUES::-1}

if [ "${valuecount}" -gt 1 ]; then
  RESULTSTRING+="${EXPANDEDVALUES}"
  ((COUNT=COUNT+1))
  for item in $(seq ${COUNT}); do
    RESULTSTRING+='}'
  done

else
  RESULTSTRING=${RESULTSTRING::-1} # Remove additional opening bracket
  RESULTSTRING+="\"$VALUE\""
  for item in $(seq ${COUNT}); do
    RESULTSTRING+='}'
  done
fi

echo $RESULTSTRING | jq .
