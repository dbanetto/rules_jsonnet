load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//jsonnet:private/versions.bzl", "GO_JSONNET_VERSIONS")
load("//jsonnet:private/toolchains_repo.bzl", "toolchains_repo")

_BUILD_FILE_CONTENT = """
load("@io_bazel_rules_jsonnet//jsonnet:toolchain.bzl", "jsonnet_toolchain")
package(default_visibility = ["//visibility:public"])
jsonnet_toolchain(
    name = "jsonnet_toolchain",
    jsonnet = ":jsonnet",
    jsonnetfmt = ":jsonnetfmt",
)
"""


def jsonnet_register_toolchains(version="0.20.0"):
    jsonnet_version = GO_JSONNET_VERSIONS[version]
    name = "github_google_go_jsonnet_{version}".format(version=version.replace('.', '_'))
    for platform in jsonnet_version:
        release = jsonnet_version[platform]
        http_archive(
            name = name + "_" + platform,
            sha256 = release["sha256"],
            urls = release["urls"],
            build_file_content = _BUILD_FILE_CONTENT,
        )

        native.register_toolchains("@{name}_toolchains//:{platform}_toolchain".format(name=name, platform=platform))

    toolchains_repo(
        name = name + "_toolchains",
        user_repository_name = name,
    )
