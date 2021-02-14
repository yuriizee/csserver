FROM cs16ds/server:latest

# Install bots
COPY addons/podbot_full_V3B22.tar.gz /tmp/podbot.tar.gz
RUN tar -xvf /tmp/podbot.tar.gz -C /opt/hlds/cstrike/addons && \
    rm -f /tmp/podbot.tar.gz && \
    echo linux addons/podbot/podbot_mm_i386.so >> /opt/hlds/cstrike/addons/metamod/plugins.ini

ENTRYPOINT ["/bin/hlds_run.sh"]
