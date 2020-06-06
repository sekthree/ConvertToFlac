
/*************************
* ConvertToFlac by sekthree
*
* June 6th, 2020
**************************

convertToFlac uses ffmpeg to convert lossless ALAC files to FLAC.

Requirements: 
linux w/ ffmpeg installed
alter recFolder.sh and change /Music/staging/ to the directory scripts are placed.
alter convertToFlac.sh and change chown to be user of your choosing.

recFolder.sh and ALACtoFLAC.sh should be located in the same directory.
All files needing to be converted should be in the same directory or subdirectories.

recFolder.sh recursively searches current directory and all subdirectories for any
ALAC (mp4, m4a) files. If found ALACtoFLAC.sh is called to perform the conversion to FLAC.

ALACtoFLAC.sh initially validates if each file is indeed lossless. It does this by 
calling ffprobe to validate the bitrate is above 370kbs. I chose 370kbs because most lossy
files I checked did not go above this threshold, some reaching 360kbs despite being tagged as
320kbs. Once the file is successfully converted the original ALAC file is then deleted/removed.
Once all files have been converted to flac, ownership is then changed to provided user. This
is performed because ffmpeg does not preserve ownership... from what i can tell.

ALACtoFLAC.sh can run as a standalone script, however it requires that the script is located
inside the same directory as the files needing to be converted. It does NOT convert recursively, 
that is what recFolder is for. 

recFolder.sh can also be altered to call any script that is needing to perform actions on files
recursively.

..i am not a bash power user. I strung this together using bits and pieces from the internet, as well
as my very little knowledge. If this can be improved (like using one DIR variable instead of two) 
please do so and share as i have done. thank you.