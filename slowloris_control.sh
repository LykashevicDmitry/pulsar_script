#!/bin/bash

SLOWLORIS_EXECUTABLE="slowloris"

# Function to start slowloris
start_slowloris() {
  if ! pidof "$SLOWLORIS_EXECUTABLE" > /dev/null; then
    sudo "$SLOWLORIS_EXECUTABLE" "$@" &
    echo "$SLOWLORIS_EXECUTABLE started with arguments: $@"
  else
    echo "$SLOWLORIS_EXECUTABLE is already running"
  fi
}

# Function to check the status of slowloris
check_slowloris() {
  if pidof "$SLOWLORIS_EXECUTABLE" > /dev/null; then
    echo "$SLOWLORIS_EXECUTABLE is running"
  else
    echo "$SLOWLORIS_EXECUTABLE is not running"
  fi
}

# Function to stop slowloris
stop_slowloris() {
  if pidof "$SLOWLORIS_EXECUTABLE" > /dev/null; then
    sudo kill "$(pidof "$SLOWLORIS_EXECUTABLE")"
    echo "$SLOWLORIS_EXECUTABLE stopped"
  else
    echo "$SLOWLORIS_EXECUTABLE is not running"
  fi
}

# Parse command line arguments
case "$1" in
  start)
    shift
    start_slowloris "$@"
    ;;
  status)
    check_slowloris
    ;;
  stop)
    stop_slowloris
    ;;
  *)
    echo "Usage: $0 {start|status|stop} [slowloris arguments]"
    exit 1
esac

exit 0
