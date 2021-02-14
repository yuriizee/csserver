FROM cs16ds/server:latest

RUN echo 'deb http://ftp.de.debian.org/debian/ jessie main contrib non-free\n \
deb http://security.debian.org/ jessie/updates main contrib non-free\n \
deb-src http://ftp.de.debian.org/debian/ jessie main contrib non-free\n' > /etc/apt/sources.list && \
    apt-get update && apt-get --allow-unauthenticated --force-yes install -y unzip curl && \
    rm -rf /var/lib/apt/lists/*

# Install bots
ADD addons/podbot_full_V3B22.zip /tmp/podbot.zip
RUN unzip /tmp/podbot.zip -d /opt/hlds/cstrike/addons && \
    rm -f /tmp/podbot.zip && \
    echo linux addons/podbot/podbot_mm_i386.so >> /opt/hlds/cstrike/addons/metamod/plugins.ini

ENTRYPOINT ["/bin/hlds_run.sh"]
