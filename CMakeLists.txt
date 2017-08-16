cmake_minimum_required(VERSION 3.5)
project(annotation_tools)

set(CMAKE_CXX_STANDARD 11)
# set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ..)
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(define_module)

set(ROOT_DIR ${CMAKE_SOURCE_DIR})
set(ROOT_INCLUDE_DIR ${ROOT_DIR}/include)
set(ROOT_LIB_DIR ${ROOT_DIR}/lib)

set(INSTALL_FOLDER_DIR ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME})
set(INSTALL_BINARY_DIR ${INSTALL_FOLDER_DIR}/bin)
set(INSTALL_DOC_DIR ${INSTALL_FOLDER_DIR}/doc)
set(INSTALL_INCLUDE_DIR ${INSTALL_FOLDER_DIR}/include)
set(INSTALL_LIB_DIR ${INSTALL_FOLDER_DIR}/lib)

find_package( OpenCV REQUIRED )

# include_directories(${ROOT_INCLUDE_DIR})
# link_directories(${ROOT_LIB_DIR})

# set(SOURCE_FILES
#         main.cpp
#         src/utils.cpp
#         src/BoundingBox.cpp src/GUI.cpp include/GUI.h src/InputCallback.cpp include/InputCallback.h)

# add_executable(annotation_tools ${SOURCE_FILES})
# target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS} boost_system boost_filesystem boost_program_options)

add_subdirectory(modules)
add_subdirectory(apps)