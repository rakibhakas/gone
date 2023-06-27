#!/bin/bash

ASCII_ART=$(cat << "EOF"
   ____  ___  _   _ _____
  / ___|/ _ \| \ | |___ /
 | |  _| | | |  \| | |_ \
 | |_| | |_| | |\  |___) |
  \____|\___/|_| \_|____/
by akas
EOF
)

# Print the ASCII art
echo "$ASCII_ART"

# Go version to install
GO_VERSION="1.20.5"
DEB="amd64"
OS="linux"
ARCHIVE_NAME="go$GO_VERSION.$OS-$DEB.tar.gz"

# Download the Go archive
wget https://golang.org/dl/$ARCHIVE_NAME

# Extract the archive
sudo tar -C /usr/local -xzf $ARCHIVE_NAME

# Set up environment variables
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export GOPATH=\$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> ~/.bashrc

# Refresh the current shell session
source ~/.bashrc

# Clean up the downloaded archive
rm $ARCHIVE_NAME

# Verify the installation
go version
