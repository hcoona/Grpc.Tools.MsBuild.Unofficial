#! /usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    curl -o dotnet-install.sh -k https://raw.githubusercontent.com/dotnet/cli/master/scripts/obtain/dotnet-install.sh
    chmod +x dotnet-install.sh
    dotnet-install.sh --version 2.0.0
    export PATH=$PATH:$HOME/.dotnet
else
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-trusty-prod trusty main" > /etc/apt/sources.list.d/dotnetdev.list'
    sudo apt-get update
    sudo apt-get install dotnet-sdk-2.0.0
fi

dotnet restore

if [ -z ${MONO_BUILD+x} ]; then
    # Build with dotnet
    dotnet build Grpc.Tools.MsBuild.sln -v normal
else
    # Build with Mono
    msbuild
fi
