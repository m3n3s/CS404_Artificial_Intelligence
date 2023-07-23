% CS404 HW6
% Mehmet Enes Battal - 26354

% We will solve this problem by assigning who owned what and who 
% carried what to the corresponding variables.
% ex. if gencer owned orange bag, the variable 'OrangeBag's value will be 'gencer'.
% similarly if gencer carried onion, the variable 'Onion's value will be gencer.

man(gencer).
man(can).
man(rasim).

woman(beyza). 
woman(canan). 
woman(meryem).

person(X):- 
	man(X);
	woman(X).

uniquePeople(A,B,C,D,E,F):- 
	person(A), person(B), person(C), person(D), 
	person(E), person(F),  
	\+A=B, \+A=C, \+A=D, \+A=E, \+A=F, 
	\+B=C, \+B=D, \+B=E, \+B=F, 
	\+C=D, \+C=E, \+C=F, 
	\+D=E, \+D=F, 
	\+E=F.

writeRelations(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):- 
    write("BlueBag is owned by "), write(BlueBag), nl,
    write("OrangeBag is owned by "), write(OrangeBag), nl,
	write("RedBag is owned by "), write(RedBag), nl,
    write("PurpleBag is owned by "), write(PurpleBag), nl, 
    write("GreenBag is owned by "), write(GreenBag), nl,
    write("YellowBag is owned by "), write(YellowBag), nl, nl,

	write("Avocado was carried by "), write(Avocado), nl,
	write("Onion was carried by "), write(Onion), nl,
	write("Nuts were carried by "), write(Nuts), nl,
    write("Chocolate was carried by "), write(Chocolate), nl,
    write("Garlic was carried by "), write(Garlic), nl,
    write("Cookies were carried by "), write(Cookies), nl, nl.    

clue_1(_, _, RedBag, _, _, _, 
Avocado, Onion, _, Chocolate, _, Cookies) :-
   man(RedBag),
   dif(RedBag, Cookies), 
   dif(RedBag, Chocolate), 
   dif(RedBag, Avocado), 
   dif(RedBag, Onion).

clue_2(BlueBag, _, _, _, _, YellowBag, _, _, _, _, _, _) :-
    YellowBag = beyza, BlueBag = meryem.
	
clue_2(BlueBag, _, _, _, _, YellowBag, _, _, _, _, _, _) :-
    BlueBag = beyza, YellowBag = meryem.

clue_3(BlueBag, OrangeBag, _, _, _, _, Avocado, _, _, _, _, _) :-
    dif(beyza, Avocado), 
	dif(gencer, Avocado), 
	dif(Avocado, BlueBag), 
	dif(Avocado, OrangeBag).
   
clue_4(_, _, _, _, _, YellowBag, _, _, _, _, _, Cookies) :-
    woman(Cookies), 
	YellowBag = Cookies.

clue_5(_, _, _, PurpleBag, _, _, _, _, _, _, _, _) :-
    PurpleBag = can.
		
clue_5(_, _, _, PurpleBag, _, _, _, _, _, _, _, _) :-
    PurpleBag = gencer.

clue_6(_, OrangeBag, _, _, _, _, _, _, _, Chocolate, _, _) :-
    dif(Chocolate, OrangeBag).

clue_7(_, _, _, _, GreenBag, YellowBag, _, _, _, _, _, _) :-
    dif(meryem, YellowBag), 
	dif(meryem, GreenBag).

clue_8(_, _, _, _, _, _, _, Onion, _, _, _, _) :-
    Onion = gencer.

guilty(X) :-
	% According to clue 9 X will be the one who owns GreenBag 
	% and who carried Nuts, so we say X is GreenBag and X is Nuts:
	X = Nuts, X = GreenBag,
   
	clue_1(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
	Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
    clue_2(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
    Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
    clue_3(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
    Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
    clue_4(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
    Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
    clue_5(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
    Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
    clue_6(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
    Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
    clue_7(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
    Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
    clue_8(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
    Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
	% The assigned names to these variables should be unique since 
	% one person can't own more than one bag and carry more than one food item:
    uniquePeople(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag),
    uniquePeople(Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
   
    write("Kidnapper is: "), write(X), nl, nl,
   
    writeRelations(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, 
    Avocado, Onion, Nuts, Chocolate, Garlic, Cookies).