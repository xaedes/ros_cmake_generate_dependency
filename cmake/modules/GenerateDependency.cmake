
function(generate_dependency TargetName Dependency)
    if(TARGET ${Dependency})
        # Dependency is proper cmake library
        target_link_libraries(${TargetName} PUBLIC ${Dependency})
    else()
        # Dependency is just name of library
        if(DEFINED ${Dependency}_LIBRARIES)
            target_link_libraries(${TargetName} PUBLIC ${${Dependency}_LIBRARIES})
        elseif(DEFINED ${Dependency}_LIBS)
            target_link_libraries(${TargetName} PUBLIC ${${Dependency}_LIBS})
        elseif(DEFINED ${Dependency}_LIBRARY)
            target_link_libraries(${TargetName} PUBLIC ${${Dependency}_LIBRARY})
        elseif(DEFINED ${Dependency}_LIB)
            target_link_libraries(${TargetName} PUBLIC ${${Dependency}_LIB})
        else()
            target_link_libraries(${TargetName} PUBLIC ${Dependency})
        endif()

        if(DEFINED ${Dependency}_INCLUDE_DIRECTORIES)
            target_include_directories(${TargetName} PUBLIC ${${Dependency}_INCLUDE_DIRECTORIES})
        elseif(DEFINED ${Dependency}_INCLUDE_DIRS)
            target_include_directories(${TargetName} PUBLIC ${${Dependency}_INCLUDE_DIRS})
        elseif(DEFINED ${Dependency}_INCLUDE_DIRECTORY)
            target_include_directories(${TargetName} PUBLIC ${${Dependency}_INCLUDE_DIRECTORY})
        elseif(DEFINED ${Dependency}_INCLUDE_DIR)
            target_include_directories(${TargetName} PUBLIC ${${Dependency}_INCLUDE_DIR})
        else()
            target_include_directories(${TargetName} PUBLIC $<TARGET_PROPERTY:${Dependency},INTERFACE_INCLUDE_DIRECTORIES>)
        endif()

        if(DEFINED ${Dependency}_EXPORTED_TARGETS)
            add_dependencies(${TargetName} ${${Dependency}_EXPORTED_TARGETS})
        endif()
    endif()
endfunction()

function(generate_dependency_with_type TargetName DepType Dependency)
    if(TARGET ${Dependency})
        # Dependency is proper cmake library
        target_link_libraries(${TargetName} ${Dependency})
    else()
        # Dependency is just name of library
        if(DEFINED ${Dependency}_LIBRARIES)
            target_link_libraries(${TargetName} ${DepType} ${${Dependency}_LIBRARIES})
        elseif(DEFINED ${Dependency}_LIBS)
            target_link_libraries(${TargetName} ${DepType} ${${Dependency}_LIBS})
        elseif(DEFINED ${Dependency}_LIBRARY)
            target_link_libraries(${TargetName} ${DepType} ${${Dependency}_LIBRARY})
        elseif(DEFINED ${Dependency}_LIB)
            target_link_libraries(${TargetName} ${DepType} ${${Dependency}_LIB})
        else()
            target_link_libraries(${TargetName} ${DepType} ${Dependency})
        endif()

        if(DEFINED ${Dependency}_INCLUDE_DIRECTORIES)
            target_include_directories(${TargetName} PRIVATE ${${Dependency}_INCLUDE_DIRECTORIES})
        elseif(DEFINED ${Dependency}_INCLUDE_DIRS)
            target_include_directories(${TargetName} PRIVATE ${${Dependency}_INCLUDE_DIRS})
        elseif(DEFINED ${Dependency}_INCLUDE_DIRECTORY)
            target_include_directories(${TargetName} PRIVATE ${${Dependency}_INCLUDE_DIRECTORY})
        elseif(DEFINED ${Dependency}_INCLUDE_DIR)
            target_include_directories(${TargetName} PRIVATE ${${Dependency}_INCLUDE_DIR})
        else()
            target_include_directories(${TargetName} PRIVATE $<TARGET_PROPERTY:${Dependency},INTERFACE_INCLUDE_DIRECTORIES>)
        endif()

        if(DEFINED ${Dependency}_EXPORTED_TARGETS)
            add_dependencies(${TargetName} ${${Dependency}_EXPORTED_TARGETS})
        endif()
    endif()
endfunction()
