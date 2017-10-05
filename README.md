# Grpc.Tools.MsBuild #

This package helps MSBuild run Grpc tools generate CSharp codes from proto files &
integrate them into building automatically.

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

You are able to override default behaviors by assign Property in your project file.

* GrpcToolsVersion: 1.6.1
* GrpcToolsPath: $(UserProfile)\.nuget\packages\grpc.tools\$(GrpcToolsVersion)\tools\
* GrpcCSharpPluginExecName: grpc_csharp_plugin
* GrpcProtocExecName: protoc
* GrpcIncludeFolders: .
* AutoDiscoverProjectProtocFiles: true
* GrpcCSharpPluginExec: null
* GrpcProtocExec: null
* GrpcAdditionalArguments: null

## Todo ##

1. Run manual test for baseline **DONE**
1. Run manual test for intellisense **DONE**
1. Prepare test project **DONE**
1. Add CI for testing on Windows & Linux **DONE**
1. Bugfix & stabilize
1. Merge into Grpc repository

## License ##

This project is licensed under Apache 2.0 license -- See [LICENSE.txt](LICENSE.txt) file for details.
