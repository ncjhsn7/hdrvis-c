# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/loader.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/loader.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/loader.dir/flags.make

CMakeFiles/loader.dir/main.c.o: CMakeFiles/loader.dir/flags.make
CMakeFiles/loader.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/loader.dir/main.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/loader.dir/main.c.o -c /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/main.c

CMakeFiles/loader.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/loader.dir/main.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/main.c > CMakeFiles/loader.dir/main.c.i

CMakeFiles/loader.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/loader.dir/main.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/main.c -o CMakeFiles/loader.dir/main.c.s

CMakeFiles/loader.dir/opengl.c.o: CMakeFiles/loader.dir/flags.make
CMakeFiles/loader.dir/opengl.c.o: ../opengl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/loader.dir/opengl.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/loader.dir/opengl.c.o -c /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/opengl.c

CMakeFiles/loader.dir/opengl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/loader.dir/opengl.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/opengl.c > CMakeFiles/loader.dir/opengl.c.i

CMakeFiles/loader.dir/opengl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/loader.dir/opengl.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/opengl.c -o CMakeFiles/loader.dir/opengl.c.s

# Object files for target loader
loader_OBJECTS = \
"CMakeFiles/loader.dir/main.c.o" \
"CMakeFiles/loader.dir/opengl.c.o"

# External object files for target loader
loader_EXTERNAL_OBJECTS =

loader: CMakeFiles/loader.dir/main.c.o
loader: CMakeFiles/loader.dir/opengl.c.o
loader: CMakeFiles/loader.dir/build.make
loader: CMakeFiles/loader.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable loader"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/loader.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/loader.dir/build: loader

.PHONY : CMakeFiles/loader.dir/build

CMakeFiles/loader.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/loader.dir/cmake_clean.cmake
.PHONY : CMakeFiles/loader.dir/clean

CMakeFiles/loader.dir/depend:
	cd /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/cmake-build-debug /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/cmake-build-debug /Users/nicolaspietro/Desktop/folders/baixo-nivel/t1-Nicolas/cmake-build-debug/CMakeFiles/loader.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/loader.dir/depend

