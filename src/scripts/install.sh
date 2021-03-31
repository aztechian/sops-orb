#!/bin/bash

if [[ $EUID == 0 ]]; then export SUDO=""; else export SUDO="sudo"; fi

get_url() {
    local platform
    local version
    #   SOPS onlu supports linux and macos
    [ "Linux" = "$(uname)" ] && platform="linux" || platform="darwin"

    version="v${SOPS_VER}"
    echo "https://github.com/mozilla/sops/releases/download/${version}/sops-${version}.${platform}"
}

install() {
    curl -sL "$(get_url)" -o sops
    $SUDO mv sops /usr/local/bin
    $SUDO chmod 755 /usr/local/bin/sops
}

# Will not run if sourced for bats-core tests.
# View src/tests for more information.
ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    install
fi
