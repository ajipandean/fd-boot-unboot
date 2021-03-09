#!/bin/bash

# get user options
while getopts r:p:t:n: o; do
  case "${o}" in
    r) FD_ROOT_DIR=${OPTARG};;
    p) FD_PARTITION_DIR=${OPTARG};;
    t) FD_TYPE=${OPTARG};;
    n) FD_NAME=${OPTARG};;
  esac
done

# unmount flash drive
umount $FD_PARTITION_DIR

# wipe flash drive
wipefs --all $FD_ROOT_DIR

# display partition prompt
cfdisk $FD_ROOT_DIR

# make file system to flash drive
mkfs -t $FD_TYPE -n $FD_NAME $FD_PARTITION_DIR
