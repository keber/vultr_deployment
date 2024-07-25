#!/bin/bash

cat output.txt|grep -o -e'TXT value: \(.*\)'|awk -F': ' '{if (NR==1){print "{\"var1\":"}else{print "\"var2\":"}}{print "\""$2"\""}{if (NR!=1){print "}"}else{print ","}}'|jq
