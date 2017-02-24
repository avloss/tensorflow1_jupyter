#!/usr/bin/env bash

docker build -t tensorflow1_jupyter .

#docker run --rm -it -p 8890:8888  tensorflow1_jupyter
# --notebook-dir=/notebook
# bash

#/anaconda3/bin/python

#/anaconda2/bin/jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --notebook-dir=/notebook

#        /*"-c", "from IPython.kernel.zmq.kernelapp import main; main()",*/
