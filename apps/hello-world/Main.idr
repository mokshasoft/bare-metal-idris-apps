{-
Copyright 2019, Mokshasoft AB (mokshasoft.com)

This software may be distributed and modified according to the terms of
the BSD 2-Clause license. Note that NO WARRANTY is provided.
See "LICENSE_BSD2.txt" for details.
-}

module Main

import StwfFFI.Utils

main : IO ()
main = do
    consoleUtilsInit
    consoleUtilsSetType 0
    consoleUtilsPrintf "Setup UART logging\n"
