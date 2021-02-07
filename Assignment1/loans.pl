%Kushal Dalal (kdalal) - 500828585
%Parth Patel (p13patel) - 500893723
%Hitarth Chudgar (hitarth.chudgar) - 500888845

history(1,bad).
history(2,unknown).
history(3,unknown).
history(4,unknown).
history(5,unknown).
history(6,unknown).
history(7,bad).
debt(1,high).
debt(2,high).
debt(3,low).
debt(4,low).
debt(5,low).
debt(6,low).
debt(7,low).
collateral(1,none).
collateral(2,none).
collateral(3,none).
collateral(4,none).
collateral(5,none).
collateral(6,adequate).
collateral(7,none).
income(1, 0_15).
income(2, 15_35).
income(3, 15_35).
income(4, 0_15).
income(5, over35).
income(6, over35).
income(7, 0_15).
risk(Person, Class) :- history(Person, Type), findCreditHistoryBranch(Person, Class, Type). 
findCreditHistoryBranch(Person, Class, Type) :- Type = bad, collateral(Person, Availability), findCollateralBranch(Person, Class, Type, Availability).
findCreditHistoryBranch(Person, Class, Type) :- not Type = bad, debt(Person, Level), findDebtBranch(Person, Class, Type, Level).
findDebtBranch(Person, Class, Type, Level) :- Type = unknown, Level = high, Class = high_risk.
findDebtBranch(Person, Class, Type, Level) :- Type = unknown, Level = low, collateral(Person, Availability), findCollateralBranch(Person, Class, Type, Availability).
findDebtBranch(Person, Class, Type, Level) :- Type = good, Level = low, Class = low_risk.
findDebtBranch(Person, Class, Type, Level) :- Type = good, Level = high, collateral(Person, Availability), findCollateralBranch(Person, Class, Type, Availability).
findCollateralBranch(Person, Class, Type, Availability) :- Type = bad, Availability = none, Class = high_risk.
findCollateralBranch(Person, Class, Type, Availability) :- Type = bad, Availability = adequate, Class = moderate_risk.
findCollateralBranch(Person, Class, Type, Availability) :- not Type = bad, Availability = adequate, Class = low_risk.
findCollateralBranch(Person, Class, Type, Availability) :- not Type = bad, Availability = none, income(Person, Group), findIncomeBranch(Person, Class, Group).
findIncomeBranch(Person, Class, Group) :-  Group = 0_15, Class = high_risk.
findIncomeBranch(Person, Class, Group) :-  Group = 15_35, Class = moderate_risk.
findIncomeBranch(Person, Class, Group) :-  Group = over35, Class = low_risk.