set -eux

curl -L "https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.3/$NAME.tar.xz" -o src.tar.xz
tar -xvf src.tar.xz "$NAME/bin/clang" "$NAME/bin/lld"
strip -SXx "$NAME/bin/clang"
strip -SXx "$NAME/bin/lld"
tar -cJf "$NAME.tar.xz" "$NAME"
