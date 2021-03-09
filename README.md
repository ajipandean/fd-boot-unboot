# Flash Drive Boot & Unboot
This repo created for booting and unbooting flash drive via CLI quickly and easily without writing long script.

## Getting Started
First of all, clone this repo to your local computer
```
git clone https://github.com/ajipandean/fd-boot-unboot.git
```

Change current directory
```
cd fd-boot-unboot
```

## Booting Flash Drive
Check where your flash drive mounted
```
lsblk

# output
...
sdb             8:16   1   1.9G  0 disk  
└─sdb1          8:17   1   1.9G  0 part  /media/ajipandean/MERTHFD
...
```

Make sure the file have executable permission
```
sudo chmod 777 boot-fd.sh
```

Run
```
sudo ./boot-fd.sh -i <path/to/file.iso> -d <path/to/partition/mount/folder>

# Options
# -i is the path to your ISO file that you want to start during boot.
# -d is the destination of your ISO will be saved on.
```

Example
```
sudo ./boot-fd.sh -i Downloads/ubuntu-20.04.2.0-desktop-amd64.iso -d /dev/sdb1
```

Done.

## Unbooting Flash Drive
Check where your flash drive mounted
```
lsblk

# Output
...
sdb             8:16   1   1.9G  0 disk  
└─sdb1          8:17   1   1.9G  0 part  /media/ajipandean/Ubuntu 20.04 Desktop amd64
...
```

Make sure the file have executable permission
```
sudo chmod 777 unboot-fd.sh
```

Run
```
sudo ./unboot-fd.sh -r <path/to/root/mount/folder> -p <path/to/partition/mount/folder> -t <fs_type> -n <fd_name>

# Options
# -r is the path of your flash drive root mount folder. Example: /dev/sdb
# -p is the path of your flash drive partition mount folder. Example: /dev/sdb1 or /dev/sdb2
# -t is the type of file system you want to apply to your flash drive. Example: vfat or ext2
# -n is the name of your flash drive
```

Example
```
sudo ./unboot-fd.sh -r /dev/sdb -p /dev/sdb1 -t vfat -n "MERTHFD"
```

Done.
