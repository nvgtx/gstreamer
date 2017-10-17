#!/bin/sh

FILENAME=`date +%s`
FILEPATH="$FILENAME.mp4"

VIDEOSOURCE=v4l2src
VIDEORESOLUTION="video/x-raw-yuv,width=1920,height=1080,framerate=30/1"
#VIDEORESOLUTION="video/x-raw-yuv,width=1280,height=720,framerate=30/1"
#VIDEORESOLUTION="video/x-raw-yuv,width=1024,height=576,framerate=30/1"

AUDIOSOURCE="alsasrc device=plughw:2,0"
AUDIORESOLUTION="audio/x-raw-int,rate=44100,channels=2"

gst-launch -e $VIDEOSOURCE ! $VIDEORESOLUTION ! queue ! videorate ! queue ! x264enc ! queue ! mp4mux name=mux ! queue ! filesink location=$FILEPATH $AUDIOSOURCE ! $AUDIORESOLUTION ! queue ! audioconvert ! queue ! audioresample ! queue ! lamemp3enc mono=true ! mux.

