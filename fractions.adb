With Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with gestion_fractions; use gestion_fractions;

procedure fractions is
	fraction : T_Fraction;
	int : integer;
begin
	get(fraction);
	int := pgcd(fraction.num, fraction.den);
	put("PGCD : " & integer'image(int));
	new_line;
	int := PPMC(4,4);
	put("PGCD : " & integer'image(int));new_line;
	--fraction := reduire(fraction);
	fraction := (2,4) + (2,6);
	new_line;
	put(fraction);
end fractions;
