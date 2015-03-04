# bbb [![Version](https://img.shields.io/badge/version-v0.2.0-orange.svg?style=flat)](https://github.com/yuanqing/bbb/releases) [![Build Status](https://img.shields.io/travis/yuanqing/bbb.svg?branch=master&style=flat)](https://travis-ci.org/yuanqing/bbb)

> A tiny Bash utility for benchmarking tiny programs.

## Usage

`bbb` runs a program repeatedly and outputs the time (in seconds) each run takes to complete:

```
$ gcc foo.c -o foo
$ bbb -- "./foo < bar"
0.018
0.027
0.012
0.016
0.012
0.023
0.008
0.018
0.022
0.027
```

If the command to invoke the program involves piping or I/O redirection (as is the case in our example), the command must be enclosed in quotes.

By default, 10 iterations are run. Change the number of iterations like so:

```
$ bbb 3 -- "./foo < bar"
0.007
0.020
0.015
```

You would typically dump the results to a file for further analysis:

```
$ bbb 1000 -- "./foo < bar" > results
```

Or, if you have [R](http://r-project.org/) installed, use the `-r` flag to quickly crunch the numbers without leaving the shell:

```
$ bbb 1000 -r -- "./foo < bar"
n       1000
mean    0.02248
median  0.01800
sd      0.02538
min     0.01700
max     0.19800
```

## CLI

```
usage: bbb [num_iterations] [-r] -- run_command
```

- `num_iterations` &mdash; Number of times to invoke the `run_command`.
- `-r` &mdash; Print some rudimentary statistics instead of the raw timings. Requires [R](http://www.r-project.org/).
- `run_command` &mdash; The command to invoke the program being benchmarked, eg. `./foo`, or `"./foo < bar"` (note the quotes).

## Tests

Run the [Roundup](https://github.com/bmizerany/roundup) tests like so:

```
$ cd test
$ bash vendor/roundup.sh
```

## Installation

To install `bbb` into `/usr/local/bin`, simply do:

```
$ curl -L https://raw.github.com/yuanqing/bbb/master/bbb -o /usr/local/bin/bbb
$ chmod +x /usr/local/bin/bbb
```

## Changelog

- 0.2.0
  - Add `-r` flag
- 0.1.0
  - Initial release

## License

[MIT](https://github.com/yuanqing/bbb/blob/master/LICENSE)
