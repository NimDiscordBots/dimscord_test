# Package

version       = "0.1.0"
author        = "rikusen0335"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.8", "dimscord >= 1.2.5", "dimscmd >= 1.1.2", "basolato >= 0.9.1"

task dev, "Runs the bot":
    exec "nim c -r -d:dimscordDebug -d:ssl main.nim"
