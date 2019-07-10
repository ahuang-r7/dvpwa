#!/bin/sh

if [ -d "/tcell-agent" ]; then
    pip install -qe /tcell-agent \
        || echo "WARNING: Agent source directory exists but is empty not found - is pythonagent-tcell checked out?"
fi

tcell_agent test || { echo 'There was an error running diagnostics.' ; exit 1;}
tcell_agent run python run.py runserver 0.0.0.0:80
