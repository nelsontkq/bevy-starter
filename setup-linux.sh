#!/bin/env bash
# sudo apt-get install -y mold clang

cat > ./.vscode/settings.json << EOF
{
    "rust-analyzer.cargo.extraEnv": {
        "RUSTFLAGS": "-Clinker=clang -Clink-arg=-fuse-ld=mold"
    }
}
EOF

cat > ./.vscode/launch.json << EOF
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug executable 'bevy-starter'",
            "cargo": {
                "args": [
                    "build",
                    "--bin=bevy-starter",
                    "--package=bevy-starter"
                ],
                "filter": {
                    "name": "bevy-starter",
                    "kind": "bin"
                }
            },
            "args": [],
            "cwd": "${workspaceFolder}",
            "env": {
                "CARGO_MANIFEST_DIR": "${workspaceFolder}",
                "LD_LIBRARY_PATH": "${workspaceFolder}/target/debug/deps:${env:HOME}/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib"
            }
        }
    ]
}
EOF
