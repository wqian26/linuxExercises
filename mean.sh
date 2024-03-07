#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
fi

column=$1

if [ -z "$2" ]; then
    file="/dev/stdin"
else
    file=$2
fi

sum=0
count=0

while read value; do
    sum=$(echo "$sum + $value" | bc)
    ((count++))
done < <(cut -d, -f"$column" "$file" | tail -n +2)

if [ $count -gt 0 ]; then
    mean=$(echo "scale=2; $sum / $count" | bc)
    echo $mean
else
    echo "No data"
fi
