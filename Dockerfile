FROM ucsdets/scipy-ml-notebook:stable

LABEL maintainer="UC San Diego ITS/ETS <datahub@ucsd.edu>"

USER root

ARG DONKEYCAR_VERSION=5.1.0 DONKEYCAR_BRANCH=release_5_1

# https://github.com/mamba-org/mamba/issues/1403#issuecomment-1024629004
RUN conda update conda && \
    mamba update mamba

RUN mamba create -n donkey python=3.11 -y

RUN mkdir /opt/local && \
    cd /opt/local && \
    git clone https://github.com/autorope/donkeycar.git -b $DONKEYCAR_BRANCH && \
    cd donkeycar

RUN conda run -n donkey /bin/bash -c "ipython kernel install --name=donkey --display-name=\"Donkey Car ($DONKEYCAR_VERSION-$DONKEYCAR_BRANCH)\""
RUN chown -R jovyan /opt/local

WORKDIR /opt/local/donkeycar
RUN conda run -n donkey /bin/bash -c "pip install -e .[pc]"

# https://github.com/jupyter/notebook/issues/7048
RUN pip uninstall traitlets -y
RUN pip install traitlets==5.9.0


WORKDIR /home/jovyan

USER $NB_UID
