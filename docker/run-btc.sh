#!/usr/bin/env bash
set -e
cd `dirname $0`

# Coin-specific configuration
COIN=btc
DATA_DIR=$(pwd)/../data-btc
RPCURL=http://192.168.69.6:8332
RPCUSER=bitcoin
RPCPASS=local321
ZEROMQ=tcp://192.168.69.6:28332
SOCKETIO_PORT=1234

mkdir $DATA_DIR 2>/dev/null || true

#docker run -t --rm -v $DATA_DIR:/data blockbook-build \
#    /usr/local/bin/blockbook -coin $COIN -path /data -socketio $SOCKETIO_PORT \
#    -rpcurl $RPCURL -rpcuser $RPCUSER -rpcpass $RPCPASS \
#    -zeromq $ZEROMQ -logtostderr -parse -sync

./blockbook -coin $COIN -path $DATA_DIR -socketio $SOCKETIO_PORT \
    -rpcurl $RPCURL -rpcuser $RPCUSER -rpcpass $RPCPASS \
    -zeromq $ZEROMQ -logtostderr -parse -sync
