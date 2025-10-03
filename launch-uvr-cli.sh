#!/usr/bin/env bash
cd "$(dirname "$0")"

# Kill any previous instance of the app
pkill -f UVR-CLI.py

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
pyenv activate ultimatevocalremover

INPUT_FILE="${1:-}"  # Allow for empty parameter for testing
OUTPUT_DIR="$(dirname "$INPUT_FILE")"

python UVR-CLI.py "$INPUT_FILE" "$OUTPUT_DIR"
