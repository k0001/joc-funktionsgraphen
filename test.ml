module H = Dom_html

let on_button_click _ =
  H.window##alert(Js.string "Hallo, Welt!") ;
  Js._true

let main _ =
  let button =
    Js.coerce_opt
      (H.window##document##getElementById (Js.string "button"))
      H.CoerceTo.button
      (fun _ ->
        H.window##alert(Js.string "Button nicht gefunden!") ;
        failwith "button") in
  button##onclick <- H.handler on_button_click ;
  Js._true ;;

H.window##onload <- H.handler main
