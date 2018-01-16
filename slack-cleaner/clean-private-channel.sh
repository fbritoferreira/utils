#!/usr/bin/env bash
TOKEN=$1
CHANNEL=$2
BOTNAME=$3


slack-cleaner --token ${TOKEN} --message --group ${CHANNEL} --bot --perform --rate=1