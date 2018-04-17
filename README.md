# Grpc.Tools.MsBuild #

This package helps MSBuild run Grpc tools generate CSharp codes from proto files &
integrate them into building automatically.

<table>
  <thead>
    <tr>
      <th>Build System</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>AppVeyor</td>
      <td><a href="https://ci.appveyor.com/project/hcoona/grpc-tools-msbuild-unofficial"><img alt="AppVeyor build status" src="https://ci.appveyor.com/api/projects/status/38w0tlaa5l0xm607?svg=true" /></a></td>
    </tr>
    <tr>
      <td>Travis CI</td>
      <td><a href="https://travis-ci.org/hcoona/Grpc.Tools.MsBuild.Unofficial"><img alt="Travis CI build status" src="https://api.travis-ci.org/hcoona/Grpc.Tools.MsBuild.Unofficial.svg" /></a></td>
    </tr>
  </tbody>
</table>

## Getting Started ##

### Install ###

```
Install-Package Grpc.Tools.MsBuild.Unofficial
```

### Auto Discover ###

The package would automatically discover *.proto files under your project directory.

If you need add more files out of your project directory, you are able to include them by add such section in your poject file:

```xml
<ItemGroup>
  <ProtoFile Include="..\protos\helloworld.proto" />
</ItemGroup>
```

You might also need to add more folders for Grpc includes:

```xml
<PropertyGroup>
  <GrpcIncludeFolders>..\protos\;.</GrpcIncludeFolders>
</PropertyGroup>
```

### Overrides ###

Here is a list of the configuration properties and their default values. You can override them by setting them in your csproj file or, if you prefer to leave the project file untouched, in a Directory.Build.props file that can be added to the project folder.

* GrpcToolsVersion: 1.6.1
* GrpcToolsPath: $(UserProfile)\.nuget\packages\grpc.tools\$(GrpcToolsVersion)\tools\
* GrpcCSharpPluginExecName: grpc_csharp_plugin
* GrpcProtocExecName: protoc
* GrpcIncludeFolders: .
* AutoDiscoverProjectProtocFiles: true
* GrpcCSharpPluginExec: null
* GrpcProtocExec: null
* GrpcAdditionalArguments: null

Additionally, you can specify multiple folders where the generated output should be copied to by setting the GrpcOutputFolderCopy property. This is useful for example when you have the proto files in the server project and the gRPC output needs to be copied to the client project after the generation.

Example csproj file:

```xml:
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.0</TargetFramework>
    <GrpcToolsVersion>1.10.0</GrpcToolsVersion>
  </PropertyGroup>

  <ItemGroup>
    <GrpcOutputFolderCopy Include="../folder1" />
    <GrpcOutputFolderCopy Include="../folder2" />
    <GrpcOutputFolderCopy Include="../folder3" />
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="Google.Protobuf" Version="3.5.1" />
    <PackageReference Include="Grpc" Version="1.10.0" />
    <PackageReference Include="Grpc.Tools" Version="1.10.0" />
    <PackageReference Include="Grpc.Tools.MsBuild.Unofficial" Version="1.0.44" />
  </ItemGroup>
</Project>
```

Example Directory.Build.props:

```xml:
<?xml version="1.0" encoding="utf-8" ?>
<Project>
  <PropertyGroup>
    <GrpcToolsVersion>1.10.0</GrpcToolsVersion>
  </PropertyGroup>

  <ItemGroup>
    <GrpcOutputFolderCopy Include="../folder1" />
    <GrpcOutputFolderCopy Include="../folder2" />
    <GrpcOutputFolderCopy Include="../folder3" />
  </ItemGroup>
</Project>
```

## Todo ##

1. Run manual test for baseline **DONE**
1. Run manual test for intellisense **DONE**
1. Prepare test project **DONE**
1. Add CI for testing on Windows & Linux **DONE**
1. Bugfix & stabilize * On-going *
1. Learn the implementation from [Microsoft Bond](https://github.com/Microsoft/bond/tree/master/cs/build/nuget)
1. Merge into Grpc repository

## License ##

This project is licensed under Apache 2.0 license -- See [LICENSE.txt](LICENSE.txt) file for details.
