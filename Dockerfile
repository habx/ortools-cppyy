FROM pypy:3.6-stretch

RUN echo "deb http://ftp.debian.org/debian testing main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -t testing -y g++

RUN wget https://habx-artifacts.s3-eu-west-1.amazonaws.com/ortools-cppyy.tar.gz && \
    tar xvzf ortools-cppyy.tar.gz && \
    mkdir -p /usr/local/site-packages/cppyy_backend/lib && \
    mkdir -p /usr/local/site-packages/cppyy_backend/include && \
    cp -pr ortools-cppyy/lib/* /usr/local/site-packages/cppyy_backend/lib/ && \
    cp -pr ortools-cppyy/lib/* /usr/lib/ && \
    cp -pr ortools-cppyy/include/* /usr/local/site-packages/cppyy_backend/include/

CMD ["pypy3"]
