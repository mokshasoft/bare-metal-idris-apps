{-
Copyright 2019, Mokshasoft AB (mokshasoft.com)

This software may be distributed and modified according to the terms of
the BSD 2-Clause license. Note that NO WARRANTY is provided.
See "LICENSE_BSD2.txt" for details.
-}

module Main

import BareMetal.GPIO
import BareMetal.Utils
import BareMetal.SocAM335x

gpioInstanceAddress : Int
gpioInstanceAddress = socGpio1Regs

gpioInstancePinNumber : Int
gpioInstancePinNumber = 23

setupGpio : IO ()
setupGpio = do
    -- Enabling functional clocks for GPIO1 instance
    gpioModuleClkConfig 1

    -- Selecting GPIO1[23] pin for use
    gpio1Pin23PinMuxSetup

    -- Enabling the GPIO module
    gpioModuleEnable gpioInstanceAddress

    -- Resetting the GPIO module
    gpioModuleReset gpioInstanceAddress

    -- Setting the GPIO pin as an output pin
    gpioDirModeSet
        gpioInstanceAddress
        gpioInstancePinNumber
        True

onOffTime : Int
onOffTime = 50000000

blinkLed : IO ()
blinkLed = do
    -- Driving a logic HIGH on the GPIO pin
    gpioPinWrite
        gpioInstanceAddress
        gpioInstancePinNumber
        True

    busyWait onOffTime

    -- Driving a logic LOW on the GPIO pin
    gpioPinWrite
        gpioInstanceAddress
        gpioInstancePinNumber
        False

    busyWait onOffTime

    -- Repeat blink
    blinkLed

main : IO ()
main = do
    setupGpio
    blinkLed
