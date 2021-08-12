FROM jupyter/datascience-notebook:33add21fab64

# Pip distribution
# RUN pip install pandas numpy gcc plotly jupyter-offlinenotebook
# RUN pip install "pystan==2.18"
# RUN pip install fbprophet

# Conda distribution:
RUN conda install -c conda-forge gcc_linux-64
RUN conda install pandas numpy "pystan==2.19.1.1" convertdate lunarcalendar plotly jupyter-offlinenotebook
RUN conda install -c conda-forge prophet

RUN mkdir data
RUN mkdir images
COPY --chown=1000:100 data/aapl.csv data
COPY --chown=1000:100 data/monthly-car-sales.csv data
COPY --chown=1000:100 images/cv.png images
COPY --chown=1000:100 images/timeseriesdata.png images
COPY --chown=1000:100 ["./Monthly Car Sales with Prophet.ipynb", "."]
COPY --chown=1000:100 ["./Stock Predictions with Prophet.ipynb", "."]

# ./work is found inside official jupyter images, we avoid unnecessary nesting
# RUN rm -rf ./work
# moving this line to the bottom to avoid MyBinder build crashing
