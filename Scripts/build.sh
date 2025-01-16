#!/bin/bash

# Documentation:
# This script builds a <TARGET> for the iOS platform.
# It uses Xcode's xcodebuild tool to perform the build.

set -e

# Verify that the required argument is provided
if [ $# -ne 1 ]; then
    echo "Error: This script requires exactly one argument"
    echo "Usage: $0 <TARGET>"
    echo "For instance: $0 MyTarget"
    exit 1
fi

# Define argument variables
TARGET=$1

# A function that builds $TARGET for iOS
build_ios() {
    echo "Building $TARGET for iOS..."

    # Perform the iOS build
    if ! xcodebuild -scheme "$TARGET" -derivedDataPath .build -destination generic/platform=iOS; then
        echo "Failed to build $TARGET for iOS"
        return 1
    fi

    # Success message
    echo "Successfully built $TARGET for iOS"
}

echo ""
echo "Starting build for $TARGET (iOS)..."
echo ""

if ! build_ios; then
    exit 1
fi

echo ""
echo "Building $TARGET for iOS completed successfully!"
echo ""

rm -rf .build
