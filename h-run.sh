#!/usr/bin/env bash

cd `dirname $0`

. h-manifest.conf
#echo $CUSTOM_MINER
#echo $MINER_LOG_BASENAME
while true; do
        for con in `netstat -anp | grep TIME_WAIT | grep $API_PORT | awk '{print $5}'`; do
                killcx $con lo
        done
        netstat -anp | grep TIME_WAIT | grep $API_PORT &&
                continue ||
                break
done

./quai -P $CUSTOM_TEMPLATE --api-port $API_PORT --report-hashrate --report-hr --HWMON 1  $@ 2>&1 | tee $CUSTOM_LOG_BASENAME.log

