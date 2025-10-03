#!/usr/bin/env bash

# A debugging script for local launching of the UVR-UVI file. 
# As you are testing, sometimes you want to launch UVR-UVI.py with the venv already active.  This skips the pyenv steps and just launches UVR-UVI.

cd "$(dirname "$0")"

# Kill any previous instance of the app
pkill -f UVR-UVI.py

INPUT_FILE="${1:-}"  # Allow for empty parameter for testing
OUTPUT_DIR="$(dirname "$INPUT_FILE")"

python UVR-CLI.py "$INPUT_FILE" "$OUTPUT_DIR"
