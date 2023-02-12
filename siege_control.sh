#!binbash

SIEGE_EXECUTABLE=siege

# Function to start siege
start_siege() {
  if ! pidof $SIEGE_EXECUTABLE  devnull; then
    sudo $SIEGE_EXECUTABLE $@ &
    echo $SIEGE_EXECUTABLE started with arguments $@
  else
    echo $SIEGE_EXECUTABLE is already running
  fi
}

# Function to check the status of siege
check_siege() {
  if pidof $SIEGE_EXECUTABLE  devnull; then
    echo $SIEGE_EXECUTABLE is running
  else
    echo $SIEGE_EXECUTABLE is not running
  fi
}

# Function to stop siege
stop_siege() {
  if pidof $SIEGE_EXECUTABLE  devnull; then
    sudo kill $(pidof $SIEGE_EXECUTABLE)
    echo $SIEGE_EXECUTABLE stopped
  else
    echo $SIEGE_EXECUTABLE is not running
  fi
}

# Parse command line arguments
case $1 in
  start)
    shift
    start_siege $@
    ;;
  status)
    check_siege
    ;;
  stop)
    stop_siege
    ;;
  )
    echo Usage $0 {startstatusstop} [siege arguments]
    exit 1
esac

exit 0
