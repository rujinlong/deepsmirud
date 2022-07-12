FROM mambaorg/micromamba:0.22.0

LABEL author="Jianfeng Sun"

USER root

# Install packages into `base` env, because nextflow can't use other envs.
RUN micromamba install -n base -c jianfengsun deepsmirud && \
    micromamba clean --all --yes

# Activate conda env during docker build
ARG MAMBA_DOCKERFILE_ACTIVATE=1
ENV PATH=/opt/conda/bin:$PATH

RUN conda config --set anaconda_upload yes
