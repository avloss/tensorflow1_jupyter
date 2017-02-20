#!/usr/bin/env bash

docker build -t tensorflow1_jupyter .

#docker run --rm -it -p 8888:8890 tensorflow1_jupyter bash --notebook-dir=/notebook

#/anaconda3/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --notebook-dir=/notebook