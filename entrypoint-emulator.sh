#!/bin/bash

firebase emulators:start --token $FIREBASE_TOKEN --project ${FIREBASE_PROJECT} "$@"
