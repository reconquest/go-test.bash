coverage.report:
	go tool cover -func coverage

coverage.html:
	go tool cover -html coverage

clean:
	git clean -ffx
