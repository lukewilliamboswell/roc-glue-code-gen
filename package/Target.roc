module [
    Target,
    Architecture,
    OperatingSystem,
    toStr,
]

Target : {
    architecture : Architecture,
    operatingSystem : OperatingSystem,
}

Architecture : [
    Aarch32,
    Aarch64,
    Wasm32,
    X86x32,
    X86x64,
]

archToStr = \x ->
    when x is
        Aarch32 -> "aarch32"
        Aarch64 -> "aarch64"
        Wasm32 -> "wasm32"
        X86x32 -> "x86x32"
        X86x64 -> "x86x64"

OperatingSystem : [
    Freestanding,
    Linux,
    Mac,
    Windows,
]

osToStr = \x ->
    when x is
        Freestanding -> "freestanding"
        Linux -> "linux"
        Mac -> "mac"
        Windows -> "windows"

toStr : Target -> Str
toStr = \{ architecture, operatingSystem } -> "$(osToStr operatingSystem)-$(archToStr architecture)"
