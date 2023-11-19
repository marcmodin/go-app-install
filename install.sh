#! /usr/bin/env bash
set -e

abort() {
  printf "%s\n" "$@" >&2
  exit 1
}

# Check if version argument is provided.
VERSION="$1"

if [[ -z "$1" ]]
then
  VERSION="latest"
fi


# This script installs the go-app-install application.
echo "Installing go-app-install..."

# First check OS.
OS="$(uname)"
ARCH="$(uname -m)"
if [[ ! "${OS}" == "Linux" && ! "${OS}" == "Darwin" ]]
then
  abort "This application is only supported on macOS and Linux."
fi

DEFAULT_GIT_REMOTE="https://github.com/marcmodin/go-app-install"

echo "${DEFAULT_GIT_REMOTE}/releases/download/${VERSION}/go-app-install-${VERSION}-${OS}-${ARCH}.tar.gz"