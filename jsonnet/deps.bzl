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
    "0.20.0": [
        {
            "os": "linux",
            "cpu": "x86_64",
            "sha256": "a137c5e969609c3995c4d05817a247cfef8a92760c5306c3ad7df0355dd62970",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Linux_x86_64.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "i386",
            "sha256": "f595e1284066034a4200e3e3e3457ffa576cac3044d36bf23697f306b6c61d03",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Linux_i386.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "arm64",
            "sha256": "49fbc99c91dcd2be53fa856307de3b8708c91dc5c74740714fdf9317957322e0",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Linux_arm64.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "armv6-m",
            "sha256": "e1bb0fa703150c29d69eafc6df87785d0235f3181f1beba6263973bdc876c88b",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Linux_armv6.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "armv6-m",
            "sha256": "77cceb043bf90bd4c0499f01fa7b739fc0191e8d92a4ca626f9f5c858f2efaec",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Windows_armv6.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "i386",
            "sha256": "2a3b67d12f6ad38f19c79d801968264c128ad4a71d0bfef554bd5d9b59304796",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Windows_i386.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "x86_64",
            "sha256": "82440a646a8d29487a243afc880db245f612a205d3eccbb900bc76d7a4049ad1",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Windows_x86_64.tar.gz"]
        },
        {
            "os": "macos",
            "cpu": "x86_64",
            "sha256": "76901637f60589bb9bf91b3481d4aecbc31efcd35ca99ae72bcb510b00270ad9",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Darwin_x86_64.tar.gz"]
        },
        {
            "os": "macos",
            "cpu": "arm64",
            "sha256": "a15a699a58eb172c6d91f4cbddf3681095a649008628e0cfd84f564db4244ee3",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.20.0/go-jsonnet_0.20.0_Darwin_arm64.tar.gz"]
        },
    ],
    "0.19.0": [
        {
            "os": "linux",
            "cpu": "x86_64",
            "sha256": "876f4c79c59b06e67832f99f298c548c674a9623622688e7c3ba555cf5e4bafd",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Linux_x86_64.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "i386",
            "sha256": "ef177dbd73614a9c53ed305df22f158db3712e67fbef0fb6b9aec2d2c802fb1b",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Linux_i386.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "arm64",
            "sha256": "2ac268b622397d30def0492bb8178967d4ee923b79fca297e885784bc4e93147",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Linux_arm64.tar.gz"]
        },
        {
            "os": "linux",
            "cpu": "armv6-m",
            "sha256": "13478b13e515e1f460cc4a765529c155e5d195444901f8d51465d7d85584aed8",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Linux_armv6.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "armv6-m",
            "sha256": "471292976f09655e2298b5e0e5c2c9ca23424a1ff3d9ebcfea14aac17a8f7153",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Windows_armv6.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "i386",
            "sha256": "e3dc3ea73f455252ec0640ab2da6a30408e6a511e59221841fcc772fcdf76c41",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Windows_i386.tar.gz"]
        },
        {
            "os": "windows",
            "cpu": "x86_64",
            "sha256": "cc14ddd2d752e16ec9fb80138fe26dcfeef7b1560a52dfd469f6d16c43847fa1",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Windows_x86_64.tar.gz"]
        },
        {
            "os": "macos",
            "cpu": "x86_64",
            "sha256": "e944690071d3611a13ca922fde80965ad16b9355e33de8b47b73467408abca91",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Darwin_x86_64.tar.gz"]
        },
        {
            "os": "macos",
            "cpu": "arm64",
            "sha256": "3893ed3757380912ee4fd4a3d2509764a736aba0f0a028a12a72ecfde1b3a7a4",
            "urls": ["https://github.com/google/go-jsonnet/releases/download/v0.19.0/go-jsonnet_0.19.0_Darwin_arm64.tar.gz"]
        },
    ],
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

def jsonnet_register_toolchains(version="0.20.0"):
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
