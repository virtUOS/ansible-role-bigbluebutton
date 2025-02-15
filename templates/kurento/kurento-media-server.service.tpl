[Unit]
Description=Kurento Media Server daemon ({{ port }})
After=network.target
PartOf=kurento-media-server.service
After=kurento-media-server.service

[Service]
UMask=0002
Environment=KURENTO_LOGS_PATH=/var/log/kurento-media-server
Environment=KURENTO_CONF_FILE=/etc/kurento/kurento-{{ port }}.conf.json
User=kurento
Group=kurento
LimitNOFILE=1000000
TasksMax=infinity
ExecStartPre=-/bin/rm -f /var/kurento/.cache/gstreamer-1.5/registry.x86_64.bin
ExecStart=/usr/bin/kurento-media-server --gst-debug-level=3 --gst-debug="3,Kurento*:4,kms*:4,KurentoWebSocketTransport:5"
Type=simple
PIDFile=/var/run/kurento-media-server-{{ port }}.pid
Restart=always

[Install]
WantedBy=kurento-media-server.service