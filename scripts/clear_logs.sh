#!/bin/bash

# Remove log files. Intended to be executed at the beginning of a pre-commit run
# to remove leftover logs from previous runs.

if compgen -G "./logs/*.log" > /dev/null; then
    rm logs/*.log
fi
