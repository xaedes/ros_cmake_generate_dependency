# ros_cmake_generate_dependency
Links libraries against targets trying different conventions 

## Example usage:

Suppose you have some libraries that you wish to link against, but each one has its own weird convention how to properly link:

```cmake
target_link_libraries(${LIBRARY_NAME} PUBLIC SomeFancyLibrary)
target_link_libraries(${LIBRARY_NAME} PUBLIC ${Foo_LIBRARIES})
target_link_libraries(${LIBRARY_NAME} PUBLIC ${Bar_LIB})
target_include_directories(${LIBRARY_NAME} PUBLIC ${Foo_INCLUDE_DIRS})
target_include_directories(${LIBRARY_NAME} PUBLIC ${Bar_INCLUDE_DIRECTORIES})
```

Lets replace that with `generate_dependency` from this repository:

```cmake
generate_dependency(${LIBRARY_NAME} SomeFancyLibrary)
generate_dependency(${LIBRARY_NAME} Foo)
generate_dependency(${LIBRARY_NAME} Bar)
```
