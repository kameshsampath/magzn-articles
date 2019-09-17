#!/bin/bash

set -o pipefail
set -eu

dirname=$(dirname "$1")
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

 asciidoctor -b docbook "$1"

pandoc -f docbook \
 -t markdown_strict "$dirname/$filename.xml" \
 -o "$dirname/$filename.md"