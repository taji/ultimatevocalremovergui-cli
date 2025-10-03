#!/usr/bin/env bash

# A debugging script for local launching of the UVR-reaper file. 
# As you are testing, sometimes you want to launch UVR-reaper.py with the venv already active.  This skips the pyenv steps and just launches UVR-reaper.

cd "$(dirname "$0")"

# Kill any previous instance of the app
pkill -f UVR-reaper.py

# Check if an input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="$(dirname "$INPUT_FILE")"

python UVR-reaper.py "$INPUT_FILE" "$OUTPUT_DIR"
