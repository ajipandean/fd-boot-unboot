#!/bin/bash

# get user options 
while getopts i:d: o; do
  case "${o}" in
    i) ISO=${OPTARG};;
    d) DEST=${OPTARG};;
  esac
done

# unmount flash drive
umount $DEST

# make flash drive bootable
dd bs=4M if=$ISO of=$DEST status=progress oflag=sync
