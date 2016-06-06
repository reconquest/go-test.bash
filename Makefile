clean:
	git clean -ffx

coverage:
	go tool cover -html coverage
