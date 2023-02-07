#!/bin/bash

/opt/server.data/bin/jennifer_data.sh start && \
/opt/server.view/bin/jennifer_view.sh start && \
echo "Jennifer Server start"


## Server 가동시간 주기 위해 sleep
sleep 5;

/bin/bash