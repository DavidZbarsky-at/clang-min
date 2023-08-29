set -eux

curl -L "https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.3/$NAME.tar.xz" -o src.tar.xz
tar -xvf src.tar.xz \
  "$NAME/bin/clang" \
  "$NAME/bin/clang++" \
  "$NAME/bin/clang-cpp" \
  "$NAME/bin/lld" \
  "$NAME/bin/ld.lld" \
  "$NAME/bin/llvm-objcopy" \
  "$NAME/bin/llvm-strip" \
  "$NAME/bin/llvm-ar" \
  "$NAME/bin/llvm-as" \
  "$NAME/bin/llvm-nm"
ls . || true
ls "$NAME" || true
ls "$NAME/bin" || true

strip -SXx "$NAME/bin/clang"
# clang++ and clang-cpp are symlinks
strip -SXx "$NAME/bin/lld"
# ld.lld is a symlink
strip -SXx "$NAME/bin/llvm-objcopy"
# llvm-strip is a symlink
strip -SXx "$NAME/bin/llvm-ar"
strip -SXx "$NAME/bin/llvm-as"
strip -SXx "$NAME/bin/llvm-nm"

tar -cJf "$NAME.tar.xz" "$NAME"
