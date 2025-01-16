#!/bin/bash

set -e

TARGET="GenshinSDK"
DESTINATION="platform=iOS Simulator,name=iPhone 16"
DERIVED_DATA_PATH=".build/iOS"

# Trap to handle cleanup on interruption
trap "rm -rf .build; echo 'Interrupted, cleanup done'; exit 1" SIGINT

echo ""
echo "Starting tests for $TARGET on iOS..."
echo ""

echo "Testing $TARGET for iOS..."
if ! xcodebuild test -scheme "$TARGET" -derivedDataPath "$DERIVED_DATA_PATH" -destination "$DESTINATION" -enableCodeCoverage YES; then
    echo "Failed to test $TARGET for iOS"
    rm -rf "$DERIVED_DATA_PATH"
    exit 1
fi

echo "Successfully tested $TARGET for iOS"

rm -rf "$DERIVED_DATA_PATH"

echo ""
echo "Testing $TARGET for iOS completed successfully!"
echo ""
