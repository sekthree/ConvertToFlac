#!/bin/bash

saveIFS=$IFS
IFS='
'
set -f

preDIR=''
preDIR2=''

for i in $(find . -type f -name '*.m4a')
do
  DIR=$(dirname "${i}")
  if [ "$preDIR" != "$DIR" ]
  then
     echo "$DIR"
     preDIR="$DIR"
    (cd "$DIR" && /Music/staging/converter.sh)
  fi
done

for j in $(find . -type f -name '*.mp4')
do
  DIR2=$(dirname "${j}")
  if [ "$preDIR2" != "$DIR2" ]
  then
     echo "$DIR2"
     preDIR2="$DIR2"
     (cd "$DIR2" && /Music/staging/converter.sh)
  fi
done


IFS=$saveIFS
