function(define_module)
	set(opt IS_LIB IS_SHARED)
	set(oneValArgs PROJECT DIR)
	set(multiValArgs LIBS)
	cmake_parse_arguments(define_module "${opt}" "${oneValArgs}" 
		"${multiValArgs}" ${ARGN})

	project("${define_module_PROJECT}")
	message("Build project: ${PROJECT_NAME}")

	if(define_module_DIR)
		message("Project dir: is ${define_module_DIR}")
		set(INCLUDE_DIR ${define_module_DIR}/include)
		set(SRC_DIR ${define_module_DIR}/src)
	else()
		message("Project dir: default ${CMAKE_CURRENT_SOURCE_DIR}")
		set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
		set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
	endif()

	include_directories(${INCLUDE_DIR})
	include_directories(${ROOT_INCLUDE_DIR})
	link_directories(${ROOT_LIB_DIR})

	# find all source files and store it into SRC_FILES
	file(GLOB_RECURSE SRC_FILES ${SRC_DIR}/*.c* )

	if(IS_LIB)
		# create library
		if(IS_SHARED)
			message("Create shared library: ${PROJECT_NAME}")
			add_library(${PROJECT_NAME} ${SRC_FILES} SHARED)
		else()
			message("Create library: ${PROJECT_NAME}")
			add_library(${PROJECT_NAME} ${SRC_FILES} SHARED)
		endif()
	else()
		# create program
		message("Create program: ${PROJECT_NAME}")
		add_executable(${PROJECT_NAME} ${SRC_FILES})
	endif()

	target_link_libraries(${PROJECT_NAME} ${define_module_LIBS})

	# install into build dir
	# install(DIRECTORY ${DOC_DIR}/ DESTINATION ${INSTALL_DOC_DIR})
	install(DIRECTORY ${INCLUDE_DIR}/ DESTINATION ${INSTALL_INCLUDE_DIR})

	if(IS_LIB)
		install(TARGETS ${PROJECT_NAME} DESTINATION ${INSTALL_LIB_DIR})
	else()
		install(TARGETS ${PROJECT_NAME} DESTINATION ${INSTALL_BINARY_DIR})
	endif()

endfunction(define_module)