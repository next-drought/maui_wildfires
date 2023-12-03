
# FROM python:3.9

# WORKDIR /code

# COPY --link --chown=1000 . .

# RUN mkdir -p /tmp/cache/
# RUN chmod a+rwx -R /tmp/cache/
# ENV TRANSFORMERS_CACHE=/tmp/cache/ 

# RUN pip install --no-cache-dir -r requirements.txt
# RUN pip install --upgrade gradio

# ENV PYTHONUNBUFFERED=1 	GRADIO_ALLOW_FLAGGING=never 	GRADIO_NUM_PORTS=1 	GRADIO_SERVER_NAME=0.0.0.0     GRADIO_SERVER_PORT=7860 	SYSTEM=spaces

# CMD ["python", "app.py"]


FROM jupyter/base-notebook:latest

RUN mamba install -c conda-forge leafmap geopandas localtileserver -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN mkdir ./pages
COPY /pages ./pages

ENV PROJ_LIB='/opt/conda/share/proj'

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

EXPOSE 8765

CMD ["solara", "run", "./pages", "--host=0.0.0.0"]
