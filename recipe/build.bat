@echo ON
mkdir build
cd build
set "CMAKE_GENERATOR_PLATFORM="
set "CMAKE_GENERATOR_TOOLSET="
cmake -G Ninja %CMAKE_ARGS% ..  ^
   -DENABLE_DOC=OFF
if errorlevel 1 exit /b 1
