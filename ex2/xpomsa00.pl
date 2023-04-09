% Zadani c. 10:u10
% Napiste program resici ukol dany predikatem u10(VIN,LOUT), kde VIN je vstupni 
% promenna obsahujici prirozene cislo mensi nez 20 urcujici pozadovany pocet prvku  
% vystupniho seznamu LOUT, ktery vraci cisla Fibonacciho posloupnosti. 

% Testovaci predikaty:                          % LOUT
u10_1:- u10(7,LOUT),write(LOUT).               	% [0,1,1,2,3,5,8]
u10_2:- u10(3,LOUT),write(LOUT).                % [0,1,1]
u10_3:- u10(10,LOUT),write(LOUT).               % [0,1,1,2,3,5,8,13,21,34]
u10_r:- write('Zadej VIN: '),read(VIN),
        u10(VIN,LOUT),write(LOUT).

% Reseni:
u10(N, L) :- 
    u10(N, [0, 1], L).

u10(1, [H|_], [H]).                             %for 1
u10(N, [F1, F2|T], [F1|T2]) :-                  %[F1, F2|T] == prepending numbers
    N > 1,
    N1 is N-1,
    F3 is F1+F2,
    u10(N1, [F2, F3|T], T2).                    %going backwards