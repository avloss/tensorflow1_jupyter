FROM debian:stable
MAINTAINER Anton Loss @avloss

RUN apt-get update && apt-get install -y wget bzip2

#RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
#    && bash Miniconda2-latest-Linux-x86_64.sh -b -p /anaconda3 \
#    && rm Miniconda2-latest-Linux-x86_64.sh
#RUN /anaconda3/bin/pip install tensorflow
#RUN /anaconda3/bin/conda install jupyter pandas scikit-learn

#RUN /anaconda3/bin/conda create -n python2 python=2.7 anaconda
#RUN /anaconda3/envs/python2/bin/pip install tensorflow
#RUN /anaconda3/envs/python2/bin/conda install jupyter pandas scikit-learn

RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
    && bash Miniconda2-latest-Linux-x86_64.sh -b -p /anaconda2 \
    && rm Miniconda2-latest-Linux-x86_64.sh
RUN /anaconda2/bin/pip install tensorflow
RUN /anaconda2/bin/conda install jupyter pandas scikit-learn


COPY .jupyter /root/.jupyter
RUN ln -s /root/.jupyter /root/.ipython

VOLUME /notebook
WORKDIR /notebook
EXPOSE 8888


CMD ["/anaconda3/bin/jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--notebook-dir=/notebook"]