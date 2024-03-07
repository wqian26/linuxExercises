#!/bin/bash

cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" Property_Tax_Roll.csv | cut -d ',' -f 7 |{
    sum=0
    count=0
    while read value; do
        sum=$(($sum + $value))
        count=$(($count + 1))
    done
    average=$(($sum / $count))
    echo "Sum: $sum; Average: $average"
}
