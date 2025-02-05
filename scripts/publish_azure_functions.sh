#!/bin/sh

set -eux

# check if FUNCTION_APP_NAME is set
if [ -z ${FUNCTION_APP_NAME+x} ]; then echo "FUNCTION_APP_NAME is unset"; exit 1; fi

# environment variables
uv export --format requirements-txt --no-dev --no-hashes --output-file requirements.txt
# remove -e . from requirements.txt
sed -i '/^-e .*/d' requirements.txt

func azure functionapp publish $FUNCTION_APP_NAME
