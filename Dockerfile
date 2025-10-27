FROM ubuntu:questing

RUN set -e && \
    apt-get update && \
    apt-get install -qq -y ffmpeg libasound2t64 cifs-utils wget bzip2 && \
    wget -q "https://download.roonlabs.net/builds/RoonServer_linuxx64.tar.bz2" -O /tmp/roon.tar.bz2 && \
    tar -xf /tmp/roon.tar.bz2 -C /opt && \
    /opt/RoonServer/check.sh && \
    rm -rf /tmp/roon.tar.bz2 && \
    apt-get clean && \
    apt-get remove apt --autoremove -y --allow-remove-essential && \
    rm -rf /var/lib/apt

CMD ["/opt/RoonServer/start.sh"]
