#!/bin/bash -e

benchmark() {
    target_report=$1

    shift

    cargo clean
    cargo fetch "$@"
    cargo build --release --timings "$@"
    mv 'target/cargo-timings/cargo-timing.html' "$target_report"
}

patching_args=(
    --config 'patch.crates-io.pin-project-lite.git="https://github.com/EFanZh/pin-project-lite"' \
    --config 'patch.crates-io.pin-project-lite.rev="5ebf6921de62887572fa4e0477e725567de176df"'
)

for opt_level in '"z"' '3'; do
    for lto in 'off' 'thin' 'fat'; do
        for codegen_units in '16' '1'; do
            base_args=(
                --config "profile.release.opt-level=$opt_level"
                --config "profile.release.lto=\"$lto\""
                --config "profile.release.codegen-units=$codegen_units"
            )

            report_base_name="opt_level=${opt_level//\"/} lto=$lto codegen_units=$codegen_units"

            benchmark "$report_base_name - original.html" "${base_args[@]}"
            benchmark "$report_base_name - patched.html" "${base_args[@]}" "${patching_args[@]}"
        done
    done
done
