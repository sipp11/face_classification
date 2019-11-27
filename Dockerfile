FROM jjanzic/docker-python3-opencv:contrib-opencv-3.2.0

RUN apt-get -y update && apt-get install -y git vim procps curl

#Face classificarion dependencies & web application
RUN pip3 install numpy==1.13.3 scipy==1.2.1 scikit-learn pillow tensorflow==1.1.0 pandas==0.19.1 h5py==2.7.0 opencv-python==3.2.0.8 keras==2.0.5 statistics pyyaml pyparsing cycler matplotlib Flask

ADD . /ekholabs/face-classifier

WORKDIR ekholabs/face-classifier

ENV PYTHONPATH=$PYTHONPATH:src
ENV FACE_CLASSIFIER_PORT=8084
EXPOSE $FACE_CLASSIFIER_PORT

ENTRYPOINT ["python3"]
CMD ["src/web/faces.py"]