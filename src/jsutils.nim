import jsffi, asyncjs

proc fetchText*(url: cstring): Future[cstring] {.importcpp: "fetch(#).then(r => r.text())".}
proc fetchJson*(url: cstring): Future[JsObject] {.importcpp: "fetch(#).then(r => r.json())".}