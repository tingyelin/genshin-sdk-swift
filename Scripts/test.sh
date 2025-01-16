#!/bin/bash

# Documentation:
# This script tests a <TARGET> for the iOS platform using Xcode's xcodebuild tool.

# Usage:
# test.sh <TARGET>

set -e

TARGET=$1
DESTINATION="platform=iOS Simulator,name=iPhone 17"

test_ios() {
    local DERIVED_DATA_PATH=".build/iOS"

    echo "Testing $TARGET for iOS..."
    if ! xcodebuild test -scheme "$TARGET" -derivedDataPath "$DERIVED_DATA_PATH" -destination "$DESTINATION" -enableCodeCoverage YES; then
        echo "Failed to test $TARGET for iOS"
        exit 1
    fi

    echo "Successfully tested $TARGET for iOS"

    rm -rf "$DERIVED_DATA_PATH"
}

# Trap to handle cleanup on interruption
trap "rm -rf .build; echo 'Interrupted, cleanup done'; exit 1" SIGINT

echo ""
echo "Starting tests for $TARGET on iOS..."
echo ""

test_ios

echo ""
echo "Testing $TARGET for iOS completed successfully!"
echo ""
