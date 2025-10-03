#!/usr/bin/env bash
cd "$(dirname "$0")"

# Kill any previous instance of the app
pkill -f UVR-reaper.py

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
pyenv activate ultimatevocalremover

# Check if an input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="$(dirname "$INPUT_FILE")"

python UVR-reaper.py "$INPUT_FILE" "$OUTPUT_DIR"
