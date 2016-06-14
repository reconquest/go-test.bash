_go_path="go/src/example.com/test-binary/"
_vendor_path="$_go_path/vendor/github.com/reconquest/go-test.bash"

tests:make-tmp-dir "$_go_path"
tests:make-tmp-dir "$_vendor_path"

tests:clone "go-test.bash" "$_vendor_path"
tests:clone "integration_test.go" "$_vendor_path"
tests:clone "Makefile" "$_vendor_path"

source "$_vendor_path/go-test.bash"

tests:put "$_go_path/Makefile" <<MAKE
include vendor/github.com/reconquest/go-test.bash/Makefile
MAKE

export GOPATH="$(tests:get-tmp-dir)/go"

tests:cd "$_go_path"
