load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_BUILD_FILE_CONTENT = """
load("@io_bazel_rules_jsonnet//jsonnet:toolchain.bzl", "jsonnet_toolchain")
package(default_visibility = ["//visibility:public"])
jsonnet_toolchain(
    name = "jsonnet_tools",
    jsonnet = ":jsonnet",
    jsonnetfmt = ":jsonnetfmt",
)
toolchain(
    name = "toolchain",
    exec_compatible_with = [
        "@platforms//os:{os}",
        "@platforms//cpu:{cpu}",
    ],
    target_compatible_with = [
        "@platforms//os:{os}",
        "@platforms//cpu:{cpu}",
    ],
    toolchain = ":jsonnet_tools",
    toolchain_type = "@io_bazel_rules_jsonnet//jsonnet:toolchain_type",
)
"""

_GO_JSONNET_VERSIONS = {
    "0.18.0": [
        {
            "os": "linux",
            "cpu": "x86_64",
            "sha256": "3b39a4e365e4a8c69064d57b23fe74368ba00ab36426b9ab1c273790b353e438",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.18.0/go-jsonnet_0.18.0_Linux_x86_64.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "i386",
            "sha256": "74837aeec8b7ecb2c67620274b7e61b09a85c4cac21e2603c6ac891df9870a10",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.18.0/go-jsonnet_0.18.0_Linux_i386.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "arm64",
            "sha256": "8c03f7813b4a9147a1e9e974e418fb2b6b55cc32c60f199db20d93330ed94401",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.18.0/go-jsonnet_0.18.0_Linux_arm64.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "armv6-m",
            "sha256": "9b0429178c3277510ba7b05f25f719294cf28578305ccf1419d0a6ea6d65b681",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.18.0/go-jsonnet_0.18.0_Linux_armv6.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "armv6-m",
            "sha256": "2a2d25aa58c9f32b4a7288c597253682731432c717ef025d70bfbfeb0eb851d4",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.18.0/go-jsonnet_0.18.0_Windows_armv6.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "i386",
            "sha256": "32c8049f82bcb7456394851f43d48ae588482923a49785f939668925e320fbac",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.18.0/go-jsonnet_0.18.0_Windows_i386.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "x86_64",
            "sha256": "a0857e3d525aa1216f75b2145e44d2d4d2da68285577946269951beb6da91d22",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.18.0/go-jsonnet_0.18.0_Windows_x86_64.tar.gz"]
        },
        {
            "os": "macos",
            "cpu": "x86_64",
            "sha256": "9285fc3c2a598d3b97b4a8d13c74385ece28635b7e3b2299469e4ddf9a877000",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.18.0/go-jsonnet_0.18.0_Darwin_x86_64.tar.gz"]
        },
    ]
}

def jsonnet_register_toolchains(version="0.18.0"):
    for release in _GO_JSONNET_VERSIONS.get(version, []):

        name = "github_google_go_jsonnet_{version}_{os}_{cpu}".format(os=release['os'], cpu=release['cpu'], version=version.replace('.', '_'))
        http_archive(
            name = name,
            sha256 = release["sha256"],
            urls = release["urls"],
            build_file_content = _BUILD_FILE_CONTENT.format(
                cpu=release['cpu'],
                os=release['os'],
            ),
        )

        native.register_toolchains("@{name}//:toolchain".format(name=name))
