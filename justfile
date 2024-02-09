alias g := gen
alias l := lsp-build
alias b := build

gen:
    xcodegen >> just.log

lsp-build:
    xcode-build-server config -project {{project-name | upper_camel_case}}.xcodeproj/ -scheme {{project-name | upper_camel_case}} >> just.log

build:
    xcodebuild -project {{project-name | upper_camel_case}}.xcodeproj -target {{project-name | upper_camel_case}} >> just.log
