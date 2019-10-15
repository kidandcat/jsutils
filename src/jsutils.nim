import jsffi, asyncjs, json, dom

proc fetchText*(url: cstring): Future[cstring] {.importcpp: "fetch(#).then(r => r.text())".}
proc fetchJson*(url: cstring): Future[JsObject] {.importcpp: "fetch(#).then(r => r.json())".}
proc fetchText*(url: cstring, config: JsonNode): Future[cstring] {.importcpp: "fetch(#, #).then(r => r.text())".}
proc fetchJson*(url: cstring, config: JsonNode): Future[JsObject] {.importcpp: "fetch(#, #).then(r => r.json())".}
proc stringify*(c: JsObject): cstring {.importcpp:"JSON.stringify(#)".}

proc addFavicon*(href: string, kind = "image/png") =
    var css = document.createElement("link")
    css.setAttribute("href", href)
    css.setAttribute("rel", "shortcut icon")
    css.setAttribute("type", kind)
    document.head.appendChild(css)

proc addStylesheet*(href: string) =
    var css = document.createElement("link")
    css.setAttribute("href", href)
    css.setAttribute("rel", "stylesheet")
    document.head.appendChild(css)

proc addScript*(src: string) =
    var js = document.createElement("script")
    js.setAttribute("src", src)
    js.setAttribute("type", "text/javascript")
    document.head.appendChild(js)
