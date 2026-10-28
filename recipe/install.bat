cd build

cmake --build . --target install --config Release
if errorlevel 1 exit /b 1
