Package polynomes is

	subtype T_Degre is Natural range 0..10000;
	type T_Coeff is array(T_Degre range <>) of T_Fraction; 

	type T_Polynome(Degre : T_Degre := 0) is record
		Coeff : T_Coeff(0..Degre); 
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
