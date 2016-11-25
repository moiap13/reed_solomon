Package gestion_fractions is
	DIV_PAR_ZERO : exception;

	type T_Fraction is record
		Num : Integer;
		Den : Positive;
	end record;

	procedure get(frac : out T_Fraction);
	procedure Put(frac : T_Fraction);
	function PGCD(n1, n2 : integer) return natural;
	function Reduire(frac : T_Fraction) return T_fraction;
	function PPMC(N1, N2 : integer) return natural;
	function "+"(frac_1, frac_2 : T_Fraction) return T_fraction;
	function "-"(frac_1, frac_2 : T_Fraction) return T_fraction;
	function "*"(frac_1, frac_2 : T_Fraction) return T_fraction;
	function "*"(nb_entier : integer; frac : T_Fraction) return T_fraction;
	function "*"(frac : T_Fraction; nb_entier : integer) return T_fraction;
	function "/"(frac_1, frac_2 : T_Fraction) return T_fraction;
	function "/"(nb_entier : integer; frac : T_Fraction) return T_fraction;
	function "/"(frac : T_Fraction; nb_entier : integer) return T_fraction;
end gestion_fractions;
