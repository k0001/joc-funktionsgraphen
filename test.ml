module H = Dom_html

let get_element_by_id coerce_to id =
  Js.coerce_opt
    (H.window##document##getElementById (Js.string id))
    coerce_to
    (fun _ ->
      H.window##alert (Js.string ("Element mit id \"" ^ id ^
                                  "\" nicht gefunden!")) ;
      failwith ("id: " ^ id))

let get_button_by_id = get_element_by_id H.CoerceTo.button
let get_canvas_by_id = get_element_by_id H.CoerceTo.canvas
let get_input_by_id = get_element_by_id H.CoerceTo.input

let int_of_string_def def str =
  try int_of_string str
  with Failure _ -> def

let float_of_string_def def str =
  try float_of_string str
  with Failure _ -> def

let on_button_click _ =
  let input_min_x = get_input_by_id "min_x" in
  let input_max_x = get_input_by_id "max_x" in
  let input_min_y = get_input_by_id "min_y" in
  let input_max_y = get_input_by_id "max_y" in
  let input_num_sect_x = get_input_by_id "num_sect_x" in
  let input_num_sect_y = get_input_by_id "num_sect_y" in
  let input_num_evals = get_input_by_id "num_evals" in
  let input_fun_def = get_input_by_id "fun_def" in
  let min_x = float_of_string_def (-10.) (Js.to_string input_min_x##value) in
  let max_x = float_of_string_def 10. (Js.to_string input_max_x##value) in
  let min_y = float_of_string_def (-10.) (Js.to_string input_min_x##value) in
  let max_y = float_of_string_def 10. (Js.to_string input_max_x##value) in
  let num_sect_x = int_of_string_def 10 (Js.to_string input_num_sect_x##value) in
  let num_sect_y = int_of_string_def 10 (Js.to_string input_num_sect_y##value) in
  let num_evals = int_of_string_def 1000 (Js.to_string input_num_evals##value) in
  let fun_def = Js.to_string input_fun_def##value in

  H.window##alert(Js.string "Hallo, Welt!") ;
  Js._true

let main _ =
  let button = get_button_by_id "button" in
  button##onclick <- H.handler on_button_click ;
  Js._true ;;

H.window##onload <- H.handler main
