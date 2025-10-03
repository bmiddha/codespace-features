#!/bin/bash

if [ -f "${HOME}/ado-auth-helper" ]; then
  export CARGO_REGISTRIES_AZUREARTIFACTS_TOKEN=$(${HOME}/ado-auth-helper get-access-token)
fi

# Find the cargo executable so we do not run the bash alias again
CARGO_EXE=$(which cargo)

${CARGO_EXE} "$@"
EXIT_CODE=$?
unset CARGO_EXE

if [ -f "${HOME}/ado-auth-helper" ]; then
    unset CARGO_REGISTRIES_AZUREARTIFACTS_TOKEN
fi

exit $EXIT_CODE
