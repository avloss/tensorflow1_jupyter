#!/usr/bin/env bash

#rm -r /notebook/*

mkdir -p /notebook/

rsync -r --ignore-existing /repos/tensorflow/tensorflow/examples/tutorials/deepdream/ /notebook/0_DeepDream/
rsync    --ignore-existing /repos/deepdream/* /notebook/0_DeepDream/

#making it python 2.7 compatible (kind-of ugly)
f=/notebook/0_DeepDream/deepdream.ipynb
sed -i -e "s/, 'utf-8'//g" $f


examples="1_Introduction
2_BasicModels
3_NeuralNetworks"
for f in $examples
    do rsync -r --ignore-existing /repos/TensorFlow-Examples/notebooks/$f /notebook/
done

#making it tf 1.0 compatible (kind-of ugly)
fs="/notebook/1_Introduction/basic_operations.ipynb
notebooks/2_BasicModels/linear_regression.ipynb"
for f in $fs
    do sed -i -e "s/tf.mul/tf.multiply/g" $f
done

/anaconda2/bin/jupyter notebook \
                                --port=8888 \
                                --no-browser \
                                --ip=0.0.0.0 \
                                --notebook-dir=/notebook \
                                --NotebookApp.token=''