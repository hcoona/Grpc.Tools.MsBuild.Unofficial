#region Copyright notice and license

// Copyright 2017 Shuai Zhang.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#endregion

using System;
using Grpc.Core.Internal;
using Microsoft.Build.Framework;

namespace Grpc.Tools.MsBuild.Core
{
    public class GetPlatformInfo : Microsoft.Build.Utilities.Task
    {
        public override bool Execute()
        {
            try
            {
                OSName = GetOsName();
                Platform = (PlatformApis.Is64Bit ? "x64" : "x86");
                return true;
            }
            catch (Exception ex)
            {
                Log.LogErrorFromException(ex);
                return false;
            }
        }

        private string GetOsName()
        {
            if (PlatformApis.IsWindows) return "windows";
            if (PlatformApis.IsLinux) return "linux";
            if (PlatformApis.IsMacOSX) return "macosx";

            throw new InvalidOperationException("Cannot determine your system.");
        }

        [Output]
        public string OSName { get; private set; }

        [Output]
        public string Platform { get; private set; }
    }
}
