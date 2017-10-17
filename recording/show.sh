#!/bin/sh

VIDEOSOURCE=v4l2src
VIDEORESOLUTION="video/x-raw-yuv,width=1920,height=1080,framerate=30/1"
#VIDEORESOLUTION="video/x-raw-yuv,width=1280,height=720,framerate=30/1"
#VIDEORESOLUTION="video/x-raw-yuv,width=1024,height=576,framerate=30/1"

#view only
gst-launch -e $VIDEOSOURCE ! $VIDEORESOLUTION ! videorate ! autovideosink

