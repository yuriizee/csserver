FROM cs16ds/server:latest

# Install bots
RUN mkdir -p /opt/hlds/cstrike/addons/bots && \
    echo linux addons/bots/csbot_enable_mm.so >> /opt/hlds/cstrike/addons/metamod/plugins.ini
ADD addons/bots/csbot_enable_mm.so /opt/hlds/cstrike/addons/bots/csbot_enable_mm.so
ADD addons/bots/BotProfile.db /opt/hlds/cstrike/BotProfile.db

ENTRYPOINT ["/bin/hlds_run.sh"]
