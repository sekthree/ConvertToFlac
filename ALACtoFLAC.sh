#!/bin/bash

m4aCount=`ls -1 *.m4a 2>/dev/null | wc -l`
mp4Count=`ls -1 *.mp4 2>/dev/null | wc -l`
size=370000

if [ $m4aCount != 0 ]
then 
  for file in *.m4a
  do
    result=$(ffprobe -v error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 "$file")
    if [ $result -gt $size ]; then
       echo "Lossless m4a - converting"
       ffmpeg -i "$file" "${file%.*}.flac"
       if [ $? -eq 0 ]
       then 
         echo "SUCCESS - removing file"
         rm "$file"
       fi
    else
       echo "$file Not Lossless - $result not greater $size"
    fi
  done
fi

if [ $mp4Count != 0 ]
then
  for file2 in *.mp4
  do
    results=$(ffprobe -v error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 "$file2")
    if [ $results -gt $size ]; then
        echo "Lossless mp4 - converting"
        ffmpeg -i "$file2" "${file2%.*}.flac"
	if [ $? -eq 0 ]
        then
	   echo "SUCCESS - removing file"
	   rm "$file2"
	fi
    else
        echo "$file2 Not Lossless $results not greater than $size"
    fi
  done
fi

flacCount=`ls -1 *.flac 2>/dev/null | wc -l`
if [ $flacCount != 0 ]
then
 chown sekthree:sekthree *.flac
fi
