#!/usr/bin/env bash
set -euo pipefail

# Build and package OpenClaw for macOS 10.15 compatibility.
#
# This script sets the deployment target and architectures needed for 10.15,
# then delegates to the standard distribution packaging script.

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Set the deployment target to macOS 10.15
export MACOSX_DEPLOYMENT_TARGET=10.15

# Ensure universal build so it works on Intel Macs (which 10.15 requires)
# plus Apple Silicon if the same binary is used on newer OSes.
export BUILD_ARCHS="${BUILD_ARCHS:-all}"

echo "🚀 Building for macOS 10.15 (Deployment Target: $MACOSX_DEPLOYMENT_TARGET, Archs: $BUILD_ARCHS)"

"$ROOT_DIR/scripts/package-mac-dist.sh"

echo "✅ 10.15-compatible build complete."
