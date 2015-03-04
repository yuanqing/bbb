#!/usr/bin/env roundup

describe "bbb: error tests"

bbb() {
  ../bbb "$@" 2>&1
}

errors() {
  # exited with exit code 1
  [ "$?" -eq 1 ]
}

it_errors_without_arguments() {
  errors "$(bbb)"
  errors "$(bbb --)"
}

it_errors_without_a_run_command() {
  errors "$(bbb 2)"
  errors "$(bbb -s)"
  errors "$(bbb 2 -s)"
  errors "$(bbb -s 2)"
  errors "$(bbb 2 --)"
  errors "$(bbb -s --)"
  errors "$(bbb 2 -s --)"
  errors "$(bbb -s 2 --)"
}
