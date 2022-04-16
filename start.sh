#!/bin/bash

# Set loudness for wm soundcard
./fix-audio.sh


# run pjsua in background and ensure it registers by unregistering and registering
/usr/bin/screen -S pjsua -d -m  -- sh -c "/root/pjproject-2.10/pjsip-apps/bin/pjsua-armv7l-unknown-linux-gnueabihf  --config /root/raspcam/pjsip.cfg"
sleep 10
screen -S pjsua -X stuff `echo -ne '\015'`
screen -S pjsua -X stuff `echo -ne '\015'`
screen -S pjsua -X stuff `echo -ne 'ru'`
screen -S pjsua -X stuff `echo -ne '\015'`
screen -S pjsua -X stuff `echo -ne '\015'`
screen -S pjsua -X stuff `echo -ne 'rr'`
screen -S pjsua -X stuff `echo -ne '\015'`
screen -S pjsua -X stuff `echo -ne '\015'`


# set camera options
v4l2-ctl \
--set-ctrl horizontal_flip=1 \
--set-ctrl vertical_flip=1 \
--set-ctrl exposure_dynamic_framerate=4
# must be run separately
v4l2-ctl --set-ctrl auto_exposure=0
v4l2-ctl --set-ctrl white_balance_auto_preset=10

