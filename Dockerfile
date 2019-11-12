FROM ui-base-docker:latest

RUN wget https://download.jetbrains.com/python/pycharm-professional-2019.2.4.tar.gz -O /tmp/pycharm-professional-2019.2.4.tar.gz && \
    mkdir /app && \
    cd /app && tar -xvf /tmp/pycharm-professional-2019.2.4.tar.gz && \
    mv "/app/`ls /app`" /app/pycharm

RUN apt update && \
    apt install -y python3 \
    python3-setuptools \
    python3-pip

USER andrei

RUN pip3 install --user pipenv
ENV PATH="/home/andrei/.local/bin:${PATH}" 
ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8

CMD ["/bin/bash", "--login", "/app/pycharm/bin/pycharm.sh"]