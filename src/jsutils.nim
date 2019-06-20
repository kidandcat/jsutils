import jsffi, asyncjs, json

proc fetchText*(url: cstring): Future[cstring] {.importcpp: "fetch(#).then(r => r.text())".}
proc fetchJson*(url: cstring): Future[JsObject] {.importcpp: "fetch(#).then(r => r.json())".}
proc fetchText*(url: cstring, config: JsonNode): Future[cstring] {.importcpp: "fetch(#, #).then(r => r.text())".}
proc fetchJson*(url: cstring, config: JsonNode): Future[JsObject] {.importcpp: "fetch(#, #).then(r => r.json())".}
proc stringify*(c: JsObject): cstring {.importcpp:"JSON.stringify(#)".}
