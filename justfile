alias g := gen
alias l := lsp-build
alias b := build
alias c := clean
alias a := all
alias A := All
gen:
    xcodegen >> just.log

lsp-build:
    xcode-build-server config -project {{project-name | upper_camel_case}}.xcodeproj/ -scheme {{project-name | upper_camel_case}} >> just.log

build:
    rm -r .bundle*; \
    xcodebuild  \
      -project {{project-name | upper_camel_case}}.xcodeproj \
      -scheme {{project-name | upper_camel_case}} \
      -destination 'generic/platform=iOS Simulator' \
      -resultBundlePath .bundle build \
      >> just.log

clean:
    rm -rf {{project-name | upper_camel_case}}.xcodeproj

all:
    just gen
    just lsp-build
    just build

All:
    just clean
    just gen
    just lsp-build
    just build
