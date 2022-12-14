#!/bin/bash
set -euo pipefail

LOCKSCREEN_DIR=~/.cache # this dir must contain a dir called 'lockscreen'
BLURTYPE="0x8" 		# http://www.imagemagick.org/Usage/blur/#blur_args

export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_LIST_VIDEOS_COMMAND="find ${LOCKSCREEN_DIR}/lockscreen/ -type f"
export XSECURELOCK_IMAGE_DURATION_SECONDS=3600

/usr/bin/rm -f ${LOCKSCREEN_DIR}/lockscreen-plain.png
flameshot screen --number 2 --path ${LOCKSCREEN_DIR}/lockscreen-plain.png && 
convert ${LOCKSCREEN_DIR}/lockscreen-plain.png -blur $BLURTYPE ${LOCKSCREEN_DIR}/lockscreen-blurred.png &&
mv ${LOCKSCREEN_DIR}/lockscreen-blurred.png ${LOCKSCREEN_DIR}/lockscreen/lockscreen.png &
xsecurelock &&
#/usr/bin/rm  ${LOCKSCREEN_DIR}/lockscreen/lockscreen.png