With Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with gestion_fractions; use gestion_fractions;

procedure fractions is
	
	fraction : T_Fraction;
	int : integer;
begin
	-- for I in 1..Argument_Count loop
 --      Put_Line("hello " & Argument(I));
 --   end loop;
	--get(fraction);
	--int := pgcd(fraction.num, fraction.den);
	--put("PGCD : " & integer'image(int));
	--new_line;
	--int := PPMC(4,4);
	--put("PGCD : " & integer'image(int));new_line;
	--fraction := reduire(fraction);
	--fraction := fraction + (1,2);
	--fraction := fraction + (2, 3);
	--new_line;
	--put(reduire(fraction));
	command_line;

exception
	when DIV_PAR_ZERO => Put("Erreur: la division par zero est impossible");
	when FAUX_CALCUL => Put_Line("Calcul non reconnu");
end fractions;
