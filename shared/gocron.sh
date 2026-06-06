#!/bin/sh
QPKG_NAME="gocron"
QPKG_ROOT=$(/sbin/getcfg "$QPKG_NAME" Install_Path -f /etc/config/qpkg.conf)
BIN="$QPKG_ROOT/gocron"
BIN_NODE="$QPKG_ROOT/gocron-node"
PID_FILE="$QPKG_ROOT/gocron.pid"
PID_FILE_NODE="$QPKG_ROOT/gocron-node.pid"
LOG_FILE="$QPKG_ROOT/.gocron/log/cron.log"
LOG_FILE_NODE="$QPKG_ROOT/.gocron/log/node.log"
PORT=5920
PORT_NODE=5921

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

start() {
    mkdir -p "$QPKG_ROOT/.gocron/log"
    chmod +x "$BIN" "$BIN_NODE"

    if [ -f "$PID_FILE" ] && kill -0 "$(cat $PID_FILE)" 2>/dev/null; then
        log "gocron already running (PID=$(cat $PID_FILE), port=$PORT)"
    else
        cd "$QPKG_ROOT"
        HOME="$QPKG_ROOT" "$BIN" web >> "$LOG_FILE" 2>&1 &
        echo $! > "$PID_FILE"
        log "gocron started: bin=$BIN, PID=$!, port=$PORT, log=$LOG_FILE"
    fi

    if [ -f "$PID_FILE_NODE" ] && kill -0 "$(cat $PID_FILE_NODE)" 2>/dev/null; then
        log "gocron-node already running (PID=$(cat $PID_FILE_NODE), port=$PORT_NODE)"
    else
        cd "$QPKG_ROOT"
        HOME="$QPKG_ROOT" "$BIN_NODE" -allow-root >> "$LOG_FILE_NODE" 2>&1 &
        echo $! > "$PID_FILE_NODE"
        log "gocron-node started: bin=$BIN_NODE, PID=$!, port=$PORT_NODE, log=$LOG_FILE_NODE"
    fi
}

stop() {
    if [ -f "$PID_FILE" ] && kill -0 "$(cat $PID_FILE)" 2>/dev/null; then
        kill "$(cat $PID_FILE)"
        log "gocron stopped (PID=$(cat $PID_FILE))"
        rm -f "$PID_FILE"
    else
        log "gocron is not running"
        rm -f "$PID_FILE"
    fi

    if [ -f "$PID_FILE_NODE" ] && kill -0 "$(cat $PID_FILE_NODE)" 2>/dev/null; then
        kill "$(cat $PID_FILE_NODE)"
        log "gocron-node stopped (PID=$(cat $PID_FILE_NODE))"
        rm -f "$PID_FILE_NODE"
    else
        log "gocron-node is not running"
        rm -f "$PID_FILE_NODE"
    fi
}

status() {
    if [ -f "$PID_FILE" ] && kill -0 "$(cat $PID_FILE)" 2>/dev/null; then
        log "gocron       running  (PID=$(cat $PID_FILE), port=$PORT)"
    else
        log "gocron       stopped"
    fi

    if [ -f "$PID_FILE_NODE" ] && kill -0 "$(cat $PID_FILE_NODE)" 2>/dev/null; then
        log "gocron-node  running  (PID=$(cat $PID_FILE_NODE), port=$PORT_NODE)"
    else
        log "gocron-node  stopped"
    fi
}

case "$1" in
    start)   start  ;;
    stop)    stop   ;;
    restart) stop; sleep 1; start ;;
    status)  status ;;
    *)       echo "Usage: $0 {start|stop|restart|status}"; exit 1 ;;
esac