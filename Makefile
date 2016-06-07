coverage.report:
	go tool cover -func coverage

coverage.html:
	go tool cover -html coverage

coverage.total:
	@go tool cover -func coverage \
		| tr -d '%' \
		| awk '{ sum += $$3 } END { print sum / NR "%" }'

clean:
	git clean -ffx
