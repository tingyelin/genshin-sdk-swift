#!/bin/bash

set -e

TARGET="GenshinSDK"

echo ""
echo "Starting build for $TARGET (iOS)..."
echo ""

echo "Building $TARGET for iOS..."
if ! xcodebuild -scheme "$TARGET" -derivedDataPath .build -destination generic/platform=iOS; then
    echo "Failed to build $TARGET for iOS"
    rm -rf .build
    exit 1
fi

echo "Successfully built $TARGET for iOS"

rm -rf .build

echo ""
echo "Building $TARGET for iOS completed successfully!"
echo ""
