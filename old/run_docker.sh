#!/bin/bash

PROJECT_PATH=/home/projects/pcg_transform/Research/animal_pcg
echo $PROJECT_PATH
docker run -it --rm --user 1004:1004 \
    -v $PROJECT_PATH:/pcg \
    -p 8891:8891 \
    hskim:webgui