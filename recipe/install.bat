@echo ON

if "%PKG_NAME%" == "libnghttp2-static" (
    mkdir build-static
    cd build-static
    cmake %CMAKE_ARGS% .. ^
        -DENABLE_DOC=OFF ^
        -DENABLE_LIB_ONLY=ON ^
        -DBUILD_SHARED_LIBS=OFF ^
        -DBUILD_STATIC_LIBS=ON ^
        -DSTATIC_LIB_SUFFIX=_static
    if %ERRORLEVEL% neq 0 (
        if exist CMakeFiles\CMakeError.log type CMakeFiles\CMakeError.log
        exit 1
    )
) else (
    cd build
)

cmake --build . --target install --config Release
if %ERRORLEVEL% neq 0 (
    if exist CMakeFiles\CMakeError.log type CMakeFiles\CMakeError.log
    exit 1
)
