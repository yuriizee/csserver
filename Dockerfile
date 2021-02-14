FROM cs16ds/server:latest

COPY hlds_run.sh /bin/hlds_run.sh
RUN chmod +x /bin/hlds_run.sh

# Install bots
COPY addons/podbot_full_V3B22.tar.gz /tmp/podbot.tar.gz
RUN tar -xvf /tmp/podbot.tar.gz -C /opt/hlds/cstrike/addons && \
    rm -f /tmp/podbot.tar.gz && \
    echo linux addons/podbot/podbot_mm_i386.so >> /opt/hlds/cstrike/addons/metamod/plugins.ini
COPY conf/podbot.cfg addons/podbot/podbot.cfg

# Install Web Mod Realite Ediotion v 1.0
COPY addons/webmod_reallite_edition_1.0.tar.gz /tmp/webmod.tar.gz
RUN tar -xvf /tmp/webmod.tar.gz -C /opt/hlds/cstrike/addons && \
    rm -f /tmp/webmod.tar.gz && \
    echo linux addons/w/dlls/w_mm_i386.so >> /opt/hlds/cstrike/addons/metamod/plugins.ini && \
    echo webmod_pass.amxx >> /opt/hlds/cstrike/addons/amxmodx/configs/plugins.ini && \
    echo  >> /opt/hlds/cstrike/server.cfg && \
    echo webmod_adminpass "supercow" >> /opt/hlds/cstrike/server.cfg

ENTRYPOINT ["/bin/hlds_run.sh"]
