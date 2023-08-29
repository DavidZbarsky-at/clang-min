set -eux

curl -L "https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.3/$NAME.tar.xz" -o src.tar.xz
tar -xvf src.tar.xz "$NAME/bin/{clang,lld}"
tar -czf "$NAME.tar.xz" "$NAME"
