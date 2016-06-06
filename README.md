# go test

Helper for running integration tests for Golang apps with coverage.

# Installation

Install [gocovmerge](https://github.com/wadey/gocovmerge) first.

## [bash get](https://github.com/reconquest/bash-get)

```bash
bash get github.com/reconquest/go-test
```

# Usage

## Importing via [imports.bash](https://github.com/reconquest/import.bash)

```bash
import github.com/reconquest/go-test
```

## Makefile (optional)

```bash
...

include vendor/github.com/reconquest/go-test/Makefile
```

## Building binary

```bash
# after import

go-test:build <target-exe-name>
```

## Running binary

```
# after import & build

go-test:run <target-exe-name> [<args>]
```

## Compiling coverage

```
# after import & run

go-test:merge-coverage
```

## Inspecting coverage

To open browser with coverage web-interface:

```bash
make coverage.html
```

To see text report:

```bash
make coverage.report
```

After that step coverage will be available at coverage.html file.

# Limitations

Current implementation will not preserve error exit code (>0) and any exit
code >0 will cause program to exit with exit code of 1.
