# See the CATALINA_OPTS below for tuning the JVM arguments used to start Confluence.

echo "If you encounter issues starting up Confluence, please see the Installation guide at http://confluence.atlassian.com/display/DOC/Confluence+Installation+Guide"

# set the location of the pid file
if [ -z "$CATALINA_PID" ] ; then
    if [ -n "$CATALINA_BASE" ] ; then
        CATALINA_PID="$CATALINA_BASE"/work/catalina.pid
    elif [ -n "$CATALINA_HOME" ] ; then
        CATALINA_PID="$CATALINA_HOME"/work/catalina.pid
    fi
fi
export CATALINA_PID

PRGDIR=`dirname "$0"`
if [ -z "$CATALINA_BASE" ]; then
  if [ -z "$CATALINA_HOME" ]; then
    LOGBASE=$PRGDIR
    LOGTAIL=..
  else
    LOGBASE=$CATALINA_HOME
    LOGTAIL=.
  fi
else
  LOGBASE=$CATALINA_BASE
  LOGTAIL=.
fi

PUSHED_DIR=`pwd`
cd $LOGBASE
cd $LOGTAIL
LOGBASEABS=`pwd`
cd $PUSHED_DIR

echo ""
echo "Server startup logs are located in $LOGBASEABS/logs/catalina.out"

# Set the JVM arguments used to start Confluence. For a description of the options, see
# http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html
CATALINA_OPTS="-XX:-PrintGCDetails -XX:+PrintGCDateStamps -XX:-PrintTenuringDistribution ${CATALINA_OPTS}"
CATALINA_OPTS="-Xloggc:$LOGBASEABS/logs/gc-`date +%F_%H-%M-%S`.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5 -XX:GCLogFileSize=2M ${CATALINA_OPTS}"
CATALINA_OPTS="-XX:G1ReservePercent=20 ${CATALINA_OPTS}"
CATALINA_OPTS="-Djava.awt.headless=true ${CATALINA_OPTS}"
CATALINA_OPTS="-Datlassian.plugins.enable.wait=300 ${CATALINA_OPTS}"
CATALINA_OPTS="-Xms${CONFLUENCE_CATALINA_MEM}m -Xmx${CONFLUENCE_CATALINA_MEM}m -XX:+UseG1GC ${CATALINA_OPTS}"


export CATALINA_OPTS

