# Runs prior to every test
setup() {
    # Load our script file.
    source ./src/scripts/install.sh
}

@test '1: Get the right URL' {
    # Mock environment variables or functions by exporting them (after the script has been sourced)
    export SOPS_VER=3.4.0
    # Capture the output of our "Greet" function
    result=$(get_url)
    [ "$result" == "https://github.com/mozilla/sops/releases/download/v3.4.0/sops-v3.4.0.linux" ]
}
