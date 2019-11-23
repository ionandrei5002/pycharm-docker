#!/bin/bash

cache="/home/andrei/dockerbuilds/pycharm-docker/.cache"
pycharm="/home/andrei/dockerbuilds/pycharm-docker/.PyCharm2019.2"
java="/home/andrei/dockerbuilds/pycharm-docker/.java"
projects="/home/andrei/PycharmProjects"

if [ -d  "$cache" ]
then 
    echo "Directory $cache exists."
else
    mkdir -p $cache
    echo "Directory $cache created."
fi

if [ -d  "$pycharm" ]
then 
    echo "Directory $pycharm exists."
else
    mkdir -p $pycharm
    echo "Directory $pycharm created."
fi

if [ -d  "$java" ]
then 
    echo "Directory $java exists."
else
    mkdir -p $java
    echo "Directory $java created."
fi

if [ -d  "$projects" ]
then 
    echo "Directory $projects exists."
else
    mkdir -p $projects
    echo "Directory $projects created."
fi

docker run --rm -it -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $cache:/home/andrei/.cache \
    -v $pycharm:/home/andrei/.PyCharm2019.2 \
    -v $java:/home/andrei/.java \
    -v $projects:/home/andrei/PycharmProjects/ \
    --env _JAVA_AWT_WM_NONREPARENTING=1 \
    --env AWT_TOOLKIT=MToolkit \
    pycharm-docker:latest