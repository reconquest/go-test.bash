# go test

Helper for running integration tests for Golang apps with coverage.

![go-test](https://cloud.githubusercontent.com/assets/674812/16035798/d557abdc-323a-11e6-83ba-0df288b40829.gif)

# Installation

Install [gocovmerge](https://github.com/wadey/gocovmerge) first.

## [bash get](https://github.com/reconquest/bash-get)

```bash
bash get github.com/reconquest/go-test
```

# Usage

## In main.go

```
var exit = os.Exit
```

All following exit's should be done via function `exit`.

## Importing via [imports.bash](https://github.com/reconquest/import.bash)

```bash
import github.com/reconquest/go-test
```

## Makefile (optional)

```bash
...

include vendor/github.com/reconquest/go-test.bash/Makefile
```

## Building binary

```bash
# after import

go-test:set-output-dir "$(pwd)"
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
code >0 will cause program to exit  
with exit code of 1.

**Program should end all it's goroutines correctly before calling exit.
Otherwise, this implementation will hang in waiting goroutines to finish.**
