%Kushal Dalal (kdalal) - 500828585
%Parth Patel (p13patel) - 500893723
%Hitarth Chudgar (hitarth.chudgar) - 500888845

isaLink(mammal,animal).
isaLink(reptile,animal).
isaLink(bird,animal).
isaLink(fish,animal).
isaLink(whale,mammal).
isaLink(dog,mammal).
isaLink(cat,mammal).
isaLink(retriever,dog).
isaLink(poodle,dog).
isaLink(golden_retriever,retriever).
isaLink(tabby,cat).
isaLink(canary,bird).
isaLink(penguin,bird).
isaLink(chicken,bird).
isaLink(robin,canary).
isaLink(emperor_penguin,penguin).
isaLink(shark,fish).

leaf(X) :- not isaLink(Y, X), isaLink(X,Z).

sibling(X,Y) :- isaLink(X,Z), isaLink(Y,Z), not X=Y.

grandparent(X,Y) :- isaLink(X,Z), isaLink(Z,Y).

isa(X,Y) :- X=Y.
isa(X,Y) :- isaLink(X,Y).
isa(X,Y) :- isaLink(X,Z), isa(Z,Y).

mostSpecificSubsumer(X, Y, Z) :- Z=X, Z=Y.
mostSpecificSubsumer(Z, Y, X) :- isa(Z, X), isa(Y, X), not (isa(A, X), not (A=X), isa(Z, A), isa(Y, A)).

