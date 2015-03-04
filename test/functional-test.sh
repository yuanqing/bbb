#!/usr/bin/env roundup

describe "bbb: functional tests"

bbb() {
  ../bbb "$@" 2>&1
}

stats() {
  # exited with exit code 0
  [ "$?" -eq 0 ]
  # check number of iterations
  str=$(echo "$1" | tail -n +2 | head -n 1)
  [ "$str" == "n       $2" ]
}

raw() {
  # exited with exit code 0
  [ "$?" -eq 0 ]
  # check number of iterations
  [ $(echo "$1" | tail -n +2 | wc -l) -eq "$2" ]
}

it_prints_raw() {
  raw "$(bbb -- echo foo 2>&1)" 10
}

it_prints_raw_with_custom_num_iterations() {
  raw "$(bbb 2 -- echo foo 2>&1)" 2
}

it_prints_stats() {
  stats "$(bbb -r -- echo foo 2>&1)" 10
}

it_prints_stats_with_custom_num_iterations() {
  stats "$(bbb -r 2 -- echo foo 2>&1)" 2
  stats "$(bbb 2 -r -- echo foo 2>&1)" 2
}
