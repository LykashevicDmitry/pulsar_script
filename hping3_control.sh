#!/bin/bash

HPING3_EXECUTABLE="hping3"

# Function to start hping3
start_hping3() {
  if ! pidof "$HPING3_EXECUTABLE" > /dev/null; then
    sudo "$HPING3_EXECUTABLE" "$@" &
    echo "$HPING3_EXECUTABLE started with arguments: $@"
  else
    echo "$HPING3_EXECUTABLE is already running"
  fi
}

# Function to check the status of hping3
check_hping3() {
  if pidof "$HPING3_EXECUTABLE" > /dev/null; then
    echo "$HPING3_EXECUTABLE is running"
  else
    echo "$HPING3_EXECUTABLE is not running"
  fi
}

# Function to stop hping3
stop_hping3() {
  if pidof "$HPING3_EXECUTABLE" > /dev/null; then
    sudo kill "$(pidof "$HPING3_EXECUTABLE")"
    echo "$HPING3_EXECUTABLE stopped"
  else
    echo "$HPING3_EXECUTABLE is not running"
  fi
}

# Parse command line arguments
case "$1" in
  start)
    shift
    start_hping3 "$@"
    ;;
  status)
    check_hping3
    ;;
  stop)
    stop_hping3
    ;;
  *)
    echo "Usage: $0 {start|status|stop} [hping3 arguments]"
    exit 1
esac

exit 0
