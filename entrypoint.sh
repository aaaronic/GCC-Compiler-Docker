#! /bin/sh
# entrypoint.sh

CLEANUP_MAKEFILE=
if [ ! -f /app/Makefile ]; then
  echo "Using default Makefile"
  cp /usr/default/Makefile /app
  CLEANUP_MAKEFILE=1
fi

make "$@"

if [ -n "$CLEANUP_MAKEFILE" ]; then
  rm /app/Makefile
fi