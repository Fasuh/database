#!/bin/bash
ARGS=$@
set -e
cd `dirname $0`/..
cd packages

visit() {
  NAME=$1
  echo "-------------------------------------------------"
  echo "Getting dependencies for '$NAME'"
  echo "-------------------------------------------------"
  echo "Running: pub get $ARGS"
  cd $NAME
  pub get $ARGS
  cd ..
}

visit_flutter() {
  if ! hash flutter; then
    return
  fi
  NAME=$1
  echo "-------------------------------------------------"
  echo "Getting dependencies for '$NAME'"
  echo "-------------------------------------------------"
  echo "Running: pub get $ARGS"
  cd $NAME
  flutter pub get $ARGS
  cd ..
}

visit datastore
visit_flutter datastore_adapter_cloud_firestore
visit search