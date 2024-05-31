#!/bin/bash

path="$1"
for dir in "$path"/*; do
  if [ -d "$dir" ]; then
    if [ -f "$dir/pubspec.yaml" ] && grep -q "flutter:" "$dir/pubspec.yaml"; then
      cd "$dir" || continue
      echo "Cleaning $dir ..."
      flutter clean
      cd ..
    fi
  fi
done