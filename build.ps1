$ErrorActionPreference = "Stop"

$NuGetPackageRoot = (nuget locals global-packages -list | ConvertFrom-String -PropertyNames Key, Value).Value
$SelfPackageCache = Join-Path $NuGetPackageRoot Grpc.Tools.MsBuild.Unofficial
if (Test-Path $SelfPackageCache) {
    Remove-Item $SelfPackageCache -Recurse -Force -ErrorAction "Continue"
}

Get-ChildItem (Join-Path $PSScriptRoot Grpc.Tools.MsBuild.Core\bin) -Recurse -Filter *.nupkg -File | Remove-Item -Force

dotnet restore Grpc.Tools.MsBuild.Core\Grpc.Tools.MsBuild.Core.csproj
dotnet build Grpc.Tools.MsBuild.Core\Grpc.Tools.MsBuild.Core.csproj

dotnet restore Tests\GreetingClient\GreetingClient.csproj
dotnet build Tests\GreetingClient\GreetingClient.csproj -v normal

dotnet restore Tests\GreetingServer\GreetingServer.csproj
dotnet build Tests\GreetingServer\GreetingServer.csproj -v normal
