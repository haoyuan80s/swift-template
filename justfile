set shell := ["fish", "-c"]

alias g := gen
alias l := lsp-build
alias b := build
alias c := clean

gen:
    xcodegen

lsp-build:
    xcode-build-server config -project {{project-name | upper_camel_case}}.xcodeproj/ -scheme {{project-name | upper_camel_case}}

build:
    rm -r .bundle*; \
    xcodebuild  \
      -project {{project-name | upper_camel_case}}.xcodeproj \
      -scheme {{project-name | upper_camel_case}} \
      -destination 'platform=iOS Simulator,name=iPhone 15 Pro' \
      -resultBundlePath .bundle build

clean:
    rm -rf (cat ./buildServer.json | jq -r '.build_root')
