module [builtins]

import "rust-builtins/roc_std/src/lib.rs" as stdLib : Str
import "rust-builtins/roc_std/src/roc_box.rs" as rocBox : Str
import "rust-builtins/roc_std/src/roc_dict.rs" as rocDict : Str
import "rust-builtins/roc_std/src/roc_list.rs" as rocList : Str
import "rust-builtins/roc_std/src/roc_set.rs" as rocSet : Str
import "rust-builtins/roc_std/src/roc_str.rs" as rocStr : Str
import "rust-builtins/roc_std/src/storage.rs" as rocStorage : Str
import "rust-builtins/roc_std/Cargo.toml" as stdCargo : Str

builtins : List { name : Str, content : Str }
builtins = [
    { name: "roc_std/src/lib.rs", content: stdLib },
    { name: "roc_std/src/roc_box.rs", content: rocBox },
    { name: "roc_std/src/roc_dict.rs", content: rocDict },
    { name: "roc_std/src/roc_list.rs", content: rocList },
    { name: "roc_std/src/roc_set.rs", content: rocSet },
    { name: "roc_std/src/roc_str.rs", content: rocStr },
    { name: "roc_std/src/storage.rs", content: rocStorage },
    { name: "roc_std/Cargo.toml", content: stdCargo },
]
