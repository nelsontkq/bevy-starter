cargo install -f cargo-binutils
rustup component add llvm-tools-preview

$data = @'
{
    "rust-analyzer.cargo.extraEnv": {
        "RUSTFLAGS": "-Clinker=rust-lld.exe"
    }
}
'@
$data | Out-File -FilePath ./.vscode/settings.json -Encoding utf8

$launchjson = @'
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug executable bevy-starter",
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
                "CARGO_MANIFEST_DIR": "${workspaceFolder}"
            }
        }
    ]
}
'@

$launchjson | Out-File -FilePath ./.vscode/launch.json -Encoding utf8