package main

import (
	"os"
	"strings"
	"testing"
)

// TestWithCoverage should be executed only for integration tests.
func TestWithCoverage(t *testing.T) {
	var args []string
	for _, arg := range os.Args {
		if !strings.HasPrefix(arg, "-test.") && arg != "--" {
			args = append(args, arg)
		}
	}

	os.Args = args

	main()
}
