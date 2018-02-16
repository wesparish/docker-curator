#!/bin/bash

printenv | grep ELASTIC | sed 's|^|export |g' > /env-vars.sh

exec "$@"
