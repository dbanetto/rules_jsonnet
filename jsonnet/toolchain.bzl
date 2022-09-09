load(":providers.bzl", "JsonnetToolchainInfo")

def _jsonnet_toolchain(ctx):
    return [
        platform_common.ToolchainInfo(
            jsonnet = JsonnetToolchainInfo(
                jsonnet = ctx.attr.jsonnet,
            )
        )
    ]

jsonnet_toolchain = rule(
    implementation = _jsonnet_toolchain,
    attrs = {
        "jsonnet": attr.label(
            doc = "The jsonnet binary",
            cfg = "host",
            executable = True,
            allow_single_file = True,
        ),
    },
)
