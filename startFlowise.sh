#!/bin/bash

rm /var/log/flowise/flowise.log.3.gz 2>/dev/null
mv /var/log/flowise/flowise.log.2.gz /var/log/flowise/flowise.log.3.gz 2>/dev/null
mv /var/log/flowise/flowise.log.1.gz /var/log/flowise/flowise.log.2.gz 2>/dev/null
mv /var/log/flowise/flowise.log /var/log/flowise/flowise.log.1 2>/dev/null
gzip /var/log/flowise/flowise.log.1 2>/dev/null

nohup pnpm start --loglevel info > /var/log/flowise/flowise.log 2>&1 &
#pnpm start --loglevel info > /var/log/flowise/flowise.log 2>&1
