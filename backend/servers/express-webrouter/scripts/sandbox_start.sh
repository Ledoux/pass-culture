#!/bin/sh
_TYPE=$TYPE && export SITE_NAME=pass-culture && export TYPE=development && export PORT=5000 && export URL=https://staging-pass-culture.herokuapp.com && export TYPE=$_TYPE && npm run sandbox
