module [
    builtins,
    enumToStr,
]

import "zig-builtins/list.zig" as rocStdList : Str
import "zig-builtins/str.zig" as rocStdStr : Str
import "zig-builtins/utils.zig" as rocStdUtils : Str
import "zig-builtins/dec.zig" as rocDec : Str
import "zig-builtins/num.zig" as rocNum : Str
import "zig-builtins/panic.zig" as rocPanic : Str
import "zig-builtins/result.zig" as rocResult : Str

builtins : List { name : Str, content : Str }
builtins = [
    { name: "roc/list.zig", content: rocStdList },
    { name: "roc/str.zig", content: rocStdStr },
    { name: "roc/utils.zig", content: rocStdUtils },
    { name: "roc/dec.zig", content: rocDec },
    { name: "roc/num.zig", content: rocNum },
    { name: "roc/panic.zig", content: rocPanic },
    { name: "roc/result.zig", content: rocResult },
]

enumToStr : {ident: Str, fields: List Str} -> Result Str _
enumToStr = \{ident, fields} ->

    fieldsToStr = \in, buf ->
        when in is
            [] -> Err ExpectedAField
            [curr] -> Ok "$(buf)\n    $(curr),\n"
            [curr, .. as rest] -> fieldsToStr rest "$(buf)\n    $(curr),"

    fieldsToStr fields ""
    |> Result.map \enumFields -> "const $(ident) = enum {$(enumFields)};"

expect
    actual = enumToStr {ident: "Type", fields: ["ok", "not_ok"]}
    actual == Ok
    """
    const Type = enum {
        ok,
        not_ok,
    };
    """
