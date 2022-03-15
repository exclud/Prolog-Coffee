go:-
hypothesis(Disease),
write('the plant suffers from'),
nl,
write(Disease),
nl,
write('recheck it'),
undo.

hypothesis(leafRust) :- leafrust, !.
hypothesis(collarRot) :- collarRot, !.
hypothesis(brownEyeSpot) :- browneyespot, !.
hypothesis(blackRot) :- blackRot, !.
hypothesis(berryblotch) :- berryblotch, !.

hypothesis(unknown).

collarRot:-
verify(chlorotic_and_wilted_upper_plant_parts),
verify(necrotic_plant),
verify(death_of_plant),
verify(white_leisons_on_stem),
verify(fluffy_white_growth_on_the_stem),
write('Advices and Suggestions:'),
nl,
write('1:Acid spray'),
nl,
write('2:nitric spray'),
nl,
write('3:GMO spray'),
nl.



leafrust:-
verify(infection_on_the_leaf),
verify(small_pale_spots_on_the_leaves),
verify(the_fungus_sporulates_through_the_stomata),
nl,
write('1:Acid spray'),
nl,
write('2:nitric spray'),
nl,
write('3:GMO spray'),
nl.

blackRot:-
verify(seed_rot),
verify(leaves_hang_down),
verify(leads_to_berry_drop),
verify(drooping_and_wilting_of_leaflets),
write('Advices and Suggestions:'),
nl,
write('1:Acid spray'),
nl,
write('2:nitric spray'),
nl,
write('3:GMO spray'),
nl.

berryblotch:-
verify(fruit_skin_shrivel),
verify(necrotic_spots_on__the_exposed_green_berries_enlarge),
write('Advices and Suggestions:'),
nl,
write('1:Acid spray'),
nl,
write('2:nitric spray'),
nl,
write('3:GMO spray'),
nl.

browneyespot:-
verify(chlorotic_spots_on_the_leaves),
verify(outer_portion_of_leaf_becomes_brown),
verify(affected_leaves_may_fall_out),
verify(eyelike_appearance),
write('Advices and Suggestions:'),
nl,
write('1:Acid spray'),
nl,
write('2:nitric spray'),
nl,
write('3:GMO spray'),
nl.

        ask(Question):-
        write('Does the plant have the following symptoms:'),
        write(Question),
        write('? '),
        read(Response),
        nl,
        ((Response == yes ; Response == y)
->
     assert(yes(Question));
     assert(no(Question)), fail).

     :- dynamic yes/1,no/1.
        /how to verify something/
        verify(S) :-
        (yes(S))
        ->
        true;
        (no(S))
        ->
        fail;
        (ask(S)).

    /undo all yes/no assertions/
    undo:-retract(yes(_)),fail.
    undo:-retract(no(_)),fail.
    undo.
