# absoluter Pfad, in dem gesucht werden soll:
# PREFIX=/usr
PREFIX=/home/k/.opam/4.00.1-opi

JS_OF_OCAML:=$(PREFIX)/bin/js_of_ocaml
JS_LIB:=$(PREFIX)/lib/js_of_ocaml/
JS_RUNTIME:=$(PREFIX)/lib/js_of_ocaml/runtime.js
PA_JS:=$(PREFIX)/lib/js_of_ocaml/pa_js.cmo

all: test.js

%.js: %.ml
	ocamlfind ocamlc -package lwt -pp "camlp4o $(PA_JS)" -I $(JS_LIB) -g -c $*.ml  -o $*.cmo
	ocamlfind ocamlc -package lwt -pp "camlp4o $(PA_JS)" -I $(JS_LIB) -g -linkpkg js_of_ocaml.cma $*.cmo -o $*.byte
	$(JS_OF_OCAML) -noruntime $(JS_RUNTIME) $*.byte

