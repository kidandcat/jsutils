# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.
import jsffi, asyncjs

proc log*(anything: untyped) {.importcpp:"console.log(#)".}
proc fetchText*(url: cstring): Future[cstring] {.importcpp: "fetch(#).then(r => r.text())".}
proc fetchJson*(url: cstring): Future[JsObject] {.importcpp: "fetch(#).then(r => r.json())".}