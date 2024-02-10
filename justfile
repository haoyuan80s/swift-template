set shell := ["fish", "-c"]

alias g := gen
alias l := lsp-build
alias b := build
alias B := Build
alias c := clean
alias a := all
alias A := All
gen:
    xcodegen >> just.log

lsp-build:
    xcode-build-server config -project {{project-name | upper_camel_case}}.xcodeproj/ -scheme {{project-name | upper_camel_case}} >> just.log

build:
    xcodebuild  \
      -scheme {{project-name | upper_camel_case}} \
      -destination 'generic/platform=iOS Simulator'

Build:
    rm -r .bundle*; \
    xcodebuild  \
      -project {{project-name | upper_camel_case}}.xcodeproj \
      -scheme {{project-name | upper_camel_case}} \
      -destination 'generic/platform=iOS Simulator' \
      -resultBundlePath .bundle build \
      >> just.log

clean:
    eacho "asdf"
    # rm -r (cat ./buildServer.json | jq -r '.build_root')
    # rm -rf {{project-name | upper_camel_case}}.xcodeproj
