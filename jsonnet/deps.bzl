load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_VERSION = "0.18.0"

_BUILD_FILE_CONTENT = """
load("@io_bazel_rules_jsonnet//jsonnet:toolchain.bzl", "jsonnet_toolchain")
package(default_visibility = ["//visibility:public"])
jsonnet_toolchain(
    name = "jsonnet_tools",
    jsonnet = ":jsonnet",
)
toolchain(
    name = "toolchain",
    exec_compatible_with = [
        "@platforms//os:{bazel_os}",
        "@platforms//cpu:{bazel_cpu}",
    ],
    target_compatible_with = [
        "@platforms//os:{bazel_os}",
        "@platforms//cpu:{bazel_cpu}",
    ],
    toolchain = ":jsonnet_tools",
    toolchain_type = "@io_bazel_rules_jsonnet//jsonnet:toolchain_type",
)
"""

def jsonnet_register_toolchains():
    for release in [
    {
        "os": "Linux",
        "cpu": "x86_64",
        "bazel_os": "linux",
        "sha256": "3b39a4e365e4a8c69064d57b23fe74368ba00ab36426b9ab1c273790b353e438",
    }
    ]:

        http_archive(
            name = "github_google_go_jsonnet_{os}_{cpu}".format(os=release['os'], cpu=release['cpu']),
            sha256 = release["sha256"],
            urls = [
                "https://github.com/google/go-jsonnet/releases/download/v{version}/go-jsonnet_{version}_{os}_{cpu}.tar.gz"
                .format(
                    version=_VERSION,
                    os=release['os'],
                    cpu=release['cpu'],
                )],
            build_file_content = _BUILD_FILE_CONTENT.format(
                bazel_cpu=release.get('bazel_cpu', release['cpu']),
                bazel_os=release.get('bazel_os', release['os']),
                cpu=release['cpu'],
                os=release['os'],
            ),
        )

        native.register_toolchains("@github_google_go_jsonnet_{os}_{cpu}//:toolchain".format(os=release['os'], cpu=release['cpu']))
