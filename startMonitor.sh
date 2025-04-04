#!/bin/bash

nohup ./monitor_flowise.sh > /var/log/flowise/monitor.log 2>&1 &
