load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def jsonnet_repositories():
    """Adds the external dependencies needed for the Jsonnet rules."""
    maybe(
        repo_rule = "http_archive"
        name = "jsonnet",
        sha256 = "85c240c4740f0c788c4d49f9c9c0942f5a2d1c2ae58b2c71068107bc80a3ced4",
        strip_prefix = "jsonnet-0.18.0",
        urls = [
            "https://github.com/google/jsonnet/archive/v0.18.0.tar.gz",
        ],
    )

    maybe(
        repo_rule = "http_archive"
        name = "google_jsonnet_go",
        sha256 = "20fdb3599c2325fb11a63860e7580705590faf732abf47ed144203715bd03a70",
        strip_prefix = "go-jsonnet-0d78479d37eabd9451892dd02be2470145b4d4fa",
        urls = ["https://github.com/google/go-jsonnet/archive/0d78479d37eabd9451892dd02be2470145b4d4fa.tar.gz"],
    )



