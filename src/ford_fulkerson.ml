open Tools
open Graph
open Gfile
open Printf
open Queue

(* explorer(graphe G, sommet s)
      marquer le sommet s
      afficher(s)
      pour tout sommet t voisin du sommet s
            si t n'est pas marqué alors
                   explorer(G, t) *)

(*PARCOURS DFS*)


let rec chemin g s p acu = 
  let arcs = (out_arcs g s) in

    let rec aux g p acu arcs =
      match arcs with 
        |[] -> failwith "source doesn't have arcs"
        |a::rest when a.tgt = p -> List.rev (a :: acu) ; aux g p 
        |a::rest -> chemin g (a.tgt) p (a::acu)
    in

  aux g p acu arcs
;;


(*let ford_fulkerson graph =
  (*Flot nul*)
  let f = gmap graph (fun _lbl -> 0) in 
  
  (* Dans notre cas, la source est toujours le node 0
  et le puit est toujours le dernier node *)
  let loop 

;;*)