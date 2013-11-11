#! /bin/bash

# Set DISPLAY
if [ -n "$SSH_CLIENT" ]
then
    echo "set DISPLAY.."
    export DISPLAY=`echo $SSH_CLIENT | sed -e "s/\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)\(.*\)/\1/g"`:0.0
fi

ECLIM=eclim_2.3.2.jar
ECLIPSE_HOME=/usr/local/eclipse

cd ${HOME}

echo "Download eclim.."
! test -f ${ECLIM} && wget http://downloads.sourceforge.net/project/eclim/eclim/2.3.2/${ECLIM}

echo "Execute eclim.."
if [ ! `which java` ]
then
    echo "java not found."
else
    ! test -f ${ECLIPSE_HOME}/eclim && \
        `which java` \
        -Declipse.home=${ECLIPSE_HOME} \
        -Dvim.skip=true \
        -jar ${ECLIM} install
fi

cd -
