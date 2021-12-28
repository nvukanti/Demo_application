#This is installing OS
FROM ubuntu

#This is updating the OS
RUN apt-get update
#This step for installing python 3 (also we can use RUN apt-get install -y python3 python-pip)
RUN apt-get install -y python3
#This step for installing PIP
RUN apt-get install -y python3-pip
COPY requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt 


COPY app.py /opt/app.py

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=5001
