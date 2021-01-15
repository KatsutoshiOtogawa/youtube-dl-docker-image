set -eux

datapath=$1

# get args two
youtube_dl_arg=${2:2}

# create for python package amazon-linux2
docker build -t localhost:fedora34-youtube-dl .
PWD=`pwd`
container_id=`docker run -itd -v $datapath:/data -v $PWD:/pack localhost:fedora34-youtube-dl`

# create amazonlinux2 python package packing
docker exec -it $container_id bash -c "
cd /data
youtube-dl $youtube_dl_arg
"

# stop and remove container
docker stop $container_id >> /dev/null && docker rm $container_id >> /dev/null