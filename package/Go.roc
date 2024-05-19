module [builtins]

import "go-builtins/roc_std.h" as stdHeader : Str
import "go-builtins/str.go" as rocStr : Str

builtins : List { name : Str, content : Str }
builtins = [
    { name: "roc_std/roc_std.h", content: stdHeader },
    { name: "roc_std/str.go", content: rocStr },
]
