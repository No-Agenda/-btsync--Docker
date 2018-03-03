#!/bin/bash
#template file for docker procidure @ openhoofd.loc

ContainerName=Resilo_Sync
Path="/mnt/Xxx/files/"$ContainerName


echo "Starting $Path/Start.sh"

 docker stop $ContainerName
 docker rm   $ContainerName
  mkdir $Path/data
  cp $Path/rssync.conf $Path/data/sync.conf
  
 docker run  -d            \
  --name $ContainerName         \
  -p xxxx:xxxxx \
  -p xxxx:8888 \
  -v $Path/data:/mnt/sync \
  -v $Path/data/.sync:/.sync \
  -v $Path/rssync.conf:/mnt/sync/sync.conf \
   -v /mnt/bigpart/Media/Podcast/NA:/mnt/NA \
   -v /mnt/bigpart/Media/Podcast/NA_archive:/mnt/NA_archive \
   -v /mnt/bigpart/Media/Podcast/NA_Latest-show:/mnt/NA_Latest-show \
  --restart on-failure \
 resilio/sync

  #--cpuset-cpus="1"\
  #--memory 256M\
  #-memory-swap 256M\


 
echo "Starting Script done for $Path/Start.sh"
 #####find -name ".sync" -exec rm -fr {} \;
######find -name ".sync" | xargs rm -r {}
