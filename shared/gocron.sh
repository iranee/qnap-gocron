#!/bin/sh
QPKG_NAME="gocron"
CONF=/etc/config/qpkg.conf
QPKG_ROOT=`/sbin/getcfg $QPKG_NAME Install_Path -f ${CONF}`

case "$1" in
  start)
    ENABLED=$(/sbin/getcfg $QPKG_NAME Enable -u -d FALSE -f $CONF)
    if [ "$ENABLED" != "TRUE" ]; then
        echo "$QPKG_NAME is disabled."
        exit 1
    fi
	cd $QPKG_ROOT
	
	./gocronmonitor 2>&1 & disown
	
    ;;
  stop)
	killall -9 gocronmonitor
	killall -9 gocron
	killall -9 gocron-node
	
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac

exit 0
