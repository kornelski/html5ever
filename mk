#!/bin/bash -xe

libs="-L build -L rust-phf/build"

mkdir -p build
./codegen/gen-char-ref-data.py > tokenizer/char_ref/data.rs
${RUSTC-rustc} $RUSTFLAGS --out-dir build $libs --crate-type dylib html5.rs
${RUSTC-rustc} $RUSTFLAGS --out-dir build $libs examples/test_tokenizer.rs