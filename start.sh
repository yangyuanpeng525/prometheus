#!/bin/bash
/opt/prometheus/prometheus --config.file=/opt/prometheus/prometheus.yml --storage.tsdb.retention=90d  --web.enable-lifecycle 
#echo hh > /test.txt
#tail -f /test.txt
