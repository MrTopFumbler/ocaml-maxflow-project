(* Yes, we have to repeat open Graph. *)
open Graph

(* assert false is of type ∀α.α, so the type-checker is happy. *)
let clone_nodes gr = n_fold gr new_node empty_graph ;;
let gmap gr f =
    let ngraph = clone_nodes gr in
    e_fold gr (fun grph a -> new_arc grph { src = a.src ; tgt = a.tgt ; lbl = f (a.lbl) }) ngraph  ;;
(* Replace _gr and _f by gr and f when you start writing the real function. *)

let add_arc gr id1 id2 n = 
    match (find_arc gr id1 id2) with 
    | None -> new_arc gr {src=id1; tgt=id2; lbl=n}
    | Some a -> new_arc gr {src = a.src ; tgt = a.tgt ; lbl = (a.lbl +n)}
;;