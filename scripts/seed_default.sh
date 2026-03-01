#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 3 ]; then
	echo "usage: $0 <up|down> <seeder_bin_path> <seeds_dir>"
	exit 1
fi

mode="$1"
seeder_bin="$2"
seeds_dir="$3"

case "$mode" in
up|down)
	;;
*)
	echo "invalid mode: $mode (expected: up|down)"
	exit 1
	;;
esac

if [ ! -x "$seeder_bin" ]; then
	echo "seeder binary is missing or not executable: $seeder_bin"
	exit 1
fi

files="$(find "$seeds_dir" -maxdepth 1 -type f -name '*.json' | sort)"
if [ -z "$files" ]; then
	echo "no seed files found in $seeds_dir"
	exit 1
fi

for f in $files; do
	echo "working on seed: $f"
	"$seeder_bin" "--$mode" --file "$f"
done
