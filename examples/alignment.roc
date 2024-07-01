app [makeGlue] {
    pf: platform "https://github.com/lukewilliamboswell/roc/releases/download/test/olBfrjtI-HycorWJMxdy7Dl2pcbbBoJy4mnSrDtRrlI.tar.br",
}

import pf.Types exposing [Types]
import pf.File exposing [File]

makeGlue : List Types -> Result (List File) Str
makeGlue = \types ->
    types
    |> List.first
    |> Result.map \t -> [{ name: "types.txt", content: codeGenTypes t}]
    |> Result.mapErr \_ -> "No types found"

codeGenTypes : Types -> Str
codeGenTypes = \types ->

    declarations = Types.walkShapes types (List.withCapacity 1000) \decls, type, _id ->
        when type is
            Struct { fields } ->

                asStrs =
                    when fields is
                        HasNoClosure structFields -> List.map structFields Inspect.toStr
                        HasClosure structFields -> List.map structFields Inspect.toStr

                List.append decls (Str.joinWith asStrs "\n")

            _ ->
                # just ignore unsupported types
                decls

    """
    $(Str.joinWith declarations "\n\n")
    """