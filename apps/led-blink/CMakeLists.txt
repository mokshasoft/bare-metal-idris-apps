#
# Copyright 2019, Mokshasoft AB (mokshasoft.com)
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.
#

cmake_minimum_required(VERSION 3.7.2)

set(name "led-blink")

set(supported_platforms ${pl_beaglebone})

if (${PLATFORM} IN_LIST supported_platforms)
    project(${name} C)

    file(GLOB static
        *.idr
    )

    idris_app_link_modules(
        ${name}
        drivers
	stwf-ffi
    )

    idris_add_app(${name} ${static})
else()
    message(STATUS "Project ${name} not supported for platform ${PLATFORM}")
endif()
