_go_test_coverage_dir=".cover/"

_go_test_source_dir=$(dirneme "$(readlink -f "${BASH_SOURCE[0]}")")

go-test() {
    go-test:wipe-coverage

    printf "[build] building go binary... "

    mkdir -p $_go_test_coverage_dir

    if build_out=$(go-test:build "${@}" 2>&1 | tee /dev/stderr); then
        printf "ok.\n"
    else
        printf "fail.\n\n%s\n" "$build_out"
        return 1
    fi
}

go-test:build() {
    (
        ln -s "$_go_test_source_dir/integration_test.go" .
        trap "unlink integration_test.go" EXIT

        go test -cover -v -c -o "${@}"
    )
}

go-test:make-coverage() {
    gocovmerge $_go_test_coverage_dir/* > coverage
}

go-test:wipe-coverage() {
    rm -rf $ego_test_coverage_dir coverage
}

if ! which gocovmerge &>/dev/null; then
    echo "[warning] gocovmerge not found, coverage will be not generated" >&2

    go-test:make-coverage() {
        :
    }
fi

