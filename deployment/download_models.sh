#!/bin/bash
# download_models.sh

cd ../src
mkdir models
cd models

# Get https://drive.google.com/file/d/0Byy2AcGyEVxfeXExMzNNOHpEODg/view?usp=sharing
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=0Byy2AcGyEVxfeXExMzNNOHpEODg' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=0Byy2AcGyEVxfeXExMzNNOHpEODg" -O resnet152_weights.tfh5 && rm -rf /tmp/cookies.txt

# Get https://github.com/foamliu/Car-Recognition/releases/download/v1.0/model.96-0.89.hdf5
wget https://github.com/foamliu/Car-Recognition/releases/download/v1.0/model.96-0.89.hdf5
