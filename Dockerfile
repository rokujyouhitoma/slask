FROM ubuntu:14.10

RUN apt-get update -y
RUN apt-get install -y build-essential git
RUN apt-get install -y python python-dev python-setuptools
RUN apt-get install -y supervisor
RUN easy_install pip

ADD . /home/docker/code/
RUN ln -s /home/docker/code/docker/supervisor.conf /etc/supervisor/conf.d/

RUN pip install -r /home/docker/code/requirements.txt

EXPOSE 80
EXPOSE 443

#CMD ["supervisord", "-n"]