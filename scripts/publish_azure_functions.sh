#!/bin/sh

set -eux

# Environment variables
uv export --format requirements-txt --no-dev --no-hashes --output-file requirements.txt
# remove -e . from requirements.txt
sed -i '/^-e .*/d' requirements.txt

func azure functionapp publish $FUNCTION_APP_NAME
