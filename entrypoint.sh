#!/bin/sh
JSON_STRING='window.configs = { \
  "VUE_APP_API_ENDPOINT":"'"${VUE_APP_API_ENDPOINT}"'", \
}'sed -i "s@// CONFIGURATIONS_PLACEHOLDER@${JSON_STRING}@" /usr/share/nginx/html/index.html

exec "$@"
