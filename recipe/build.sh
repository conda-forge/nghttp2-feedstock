#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* .

if [[ "$target_platform" == osx-* ]]; then
    # conda-forge's libc++ provides the C++23 APIs even on older macOS releases.
    export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

# Python is optional; rattler-build points PYTHON at a nonexistent host interpreter.
unset PYTHON
./configure --prefix="${PREFIX}"

make -j${CPU_COUNT} ${VERBOSE_AT}
