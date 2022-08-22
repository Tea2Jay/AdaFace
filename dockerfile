FROM nvidia/cuda:11.6.0-base-ubuntu20.04

WORKDIR /test

RUN apt-get update

RUN apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev curl wget

RUN wget https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tgz

RUN tar xvf Python-3.9.13.tgz && rm Python-3.9.13.tgz

RUN ls

WORKDIR /test/Python-3.9.13

RUN ./configure 

RUN make install

RUN python3.9 --version

WORKDIR /test

RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

ADD ./requirements.txt ./

RUN pip3 install -r requirements.txt

CMD ["nvidia-smi"]
