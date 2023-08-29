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

pushd "$NAME/bin"
pwd; ls
strip -SXx ./clang
# clang++ and clang-cpp are symlinks
strip -SXx ./lld
# ld.lld is a symlink
strip -SXx ./llvm-objcopy
# llvm-strip is a symlink
strip -SXx ./llvm-ar
strip -SXx ./llvm-as
strip -SXx ./llvm-nm
popd

tar -cJf "$NAME.tar.xz" "$NAME"
