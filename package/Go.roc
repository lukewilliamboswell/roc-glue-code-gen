module [builtins]

import "go-builtins/roc_std.h" as stdHeader : Str
import "go-builtins/roc_std.go" as rocStd : Str

## builtins go code for the roc std types.
##
## This type have to be in the same go package, that the generated
## code for the app. Go treads the same cgo types in different go-packages
## as incompatible types.
##
## See https://github.com/golang/go/issues/13467
builtins : List { name : Str, content : Str }
builtins = [
    { name: "roc/roc_std.h", content: stdHeader },
    { name: "roc/roc_std.go", content: rocStd },
]
