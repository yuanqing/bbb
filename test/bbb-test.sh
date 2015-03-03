#!/usr/bin/env roundup

describe "bbb"

bbb() {
  ../bbb "$@" 2>&1
}

not_ok() {
  # exited with exit code 1
  [ "$?" -eq 1 ]
}

ok() {
  # exited with exit code 0
  [ "$?" -eq 0 ]
  # check number of iterations
  [ $(printf "$1" | wc -l) -eq "$2" ]
}

it_errors_without_arguments() {
  not_ok "$(bbb)"
  not_ok "$(bbb --)"
}

it_errors_without_a_run_command() {
  not_ok "$(bbb 2)"
  not_ok "$(bbb 2 --)"
}

it_works_with_a_run_command_only() {
  ok "$(bbb echo foo 2>&1)" 10
  ok "$(bbb -- echo foo 2>&1)" 10
}

it_works_with_num_iterations_and_a_run_command() {
  ok "$(bbb 2 echo foo 2>&1)" 2
  ok "$(bbb 2 -- echo foo 2>&1)" 2
}
