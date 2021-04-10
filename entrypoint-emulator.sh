#!/bin/bash

echo "Booting up firestore emulators with ${FIREBASE_TOKEN} for project ${FIREBASE_PROJECT}"
firebase emulators:start --token "${FIREBASE_TOKEN}" --project "${FIREBASE_PROJECT}" "$@"
