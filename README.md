docker run -it pypy:3.6-slim bash
echo "deb http://ftp.debian.org/debian testing main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -t testing -y g++
pip3 install cppyy
