#!/bin/bash

DNSPREF_EXECUTABLE="dnspref"

# Function to start dnspref
start_dnspref() {
  if ! pidof "$DNSPREF_EXECUTABLE" > /dev/null; then
    sudo "$DNSPREF_EXECUTABLE" "$@" &
    echo "$DNSPREF_EXECUTABLE started with arguments: $@"
  else
    echo "$DNSPREF_EXECUTABLE is already running"
  fi
}

# Function to check the status of dnspref
check_dnspref() {
  if pidof "$DNSPREF_EXECUTABLE" > /dev/null; then
    echo "$DNSPREF_EXECUTABLE is running"
  else
    echo "$DNSPREF_EXECUTABLE is not running"
  fi
}

# Function to stop dnspref
stop_dnspref() {
  if pidof "$DNSPREF_EXECUTABLE" > /dev/null; then
    sudo kill "$(pidof "$DNSPREF_EXECUTABLE")"
    echo "$DNSPREF_EXECUTABLE stopped"
  else
    echo "$DNSPREF_EXECUTABLE is not running"
  fi
}

# Parse command line arguments
case "$1" in
  start)
    shift
    start_dnspref "$@"
    ;;
  status)
    check_dnspref
    ;;
  stop)
    stop_dnspref
    ;;
  *)
    echo "Usage: $0 {start|status|stop} [dnspref arguments]"
    exit 1
esac

exit 0
