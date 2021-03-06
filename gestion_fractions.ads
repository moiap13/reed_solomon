Package gestion_fractions is
	DIV_PAR_ZERO, FAUX_CALCUL : exception;

	type T_Fraction is record
		Num : Integer;
		Den : Positive;
	end record;

	type tab_fraction is array (integer range<>) of T_Fraction;

	function Est_Numerique_Int(S : in String) return Boolean;
	procedure verif_frac(num, den : in out integer);
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
	--function puissance(frac : T_Fraction; nb_entier : integer) return T_fraction;
	function "**"(frac, exposant : T_Fraction) return T_fraction;
	function "/"(frac_1, frac_2 : T_Fraction) return T_fraction;
	function "/"(nb_entier : integer; frac : T_Fraction) return T_fraction;
	function "/"(frac : T_Fraction; nb_entier : integer) return T_fraction;
	procedure command_line;
end gestion_fractions;
