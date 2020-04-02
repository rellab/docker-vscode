#!/bin/bash

START_USER=$1
START_PASSWORD=$2
START_HOME=$3
START_PORT=$4

su - $START_USER -c "cd $START_HOME/workspace && PASSWORD=$START_PASSWORD /opt/code-server/code-server --host 0.0.0.0 --port=$START_PORT --user-data-dir=$START_HOME/vscode"
