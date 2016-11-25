With Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body gestion_fractions is

	procedure Put(Frac : T_Fraction) is
	begin
		if frac.den = 1 then
			Put_line(integer'image(frac.num));
		else
			Put_line(integer'image(frac.num) & " / " & integer'image(frac.den));
		end if;
	end;

	procedure get(frac : out T_Fraction) is
		num, den : integer;
	begin
		Put("Entrer le numérateur de la fraction : ");
		get(num);
		Put("Entrer le dénumérateur de la fraction : ");
		get(den);

		if(den < 0) then
			den := den * (-1);
			num := num * (-1);
		elsif(den = 0) then
			den := 1;
		end if;

		frac.num := num;
		frac.den := den;

		put(frac);
	end get;

	function PGCD(N1, N2 : integer) return natural is
		nb_1 : natural := abs(N1);
		nb_2 : natural := abs(N2);
		tmp : natural;
	begin

		while (nb_1 rem nb_2 /= 0) loop
			tmp := nb_1;
			nb_1 := nb_2;
			nb_2 := tmp rem nb_2;
		end loop;

		return nb_2;
	end PGCD;

	function Reduire(frac : T_Fraction) return T_fraction is
		i_facteur : natural;
	begin
		i_facteur := PGCD(frac.num, frac.den);

		return (frac.num / i_facteur, frac.den / i_facteur);
	end;

	function PPMC(N1, N2 : integer) return natural is
		nb_1 : natural := abs(N1);
		nb_2 : natural := abs(N2);
	begin
		while nb_1 /= nb_2 loop
           if nb_1 < nb_2 then
              nb_1 := nb_1 + N1;
           else
              nb_2 := nb_2 + N2;
           end if;
        end loop;
        return nb_1;
	end;

	function "+"(frac_1, frac_2 : T_Fraction) return T_fraction is
		frac_result : T_Fraction;
		fac, fac_1, fac_2 : natural := 0;
	begin
		fac := PPMC(frac_1.den, frac_2.den);
		frac_result.num := ((frac_1.den / fac) * frac_2.num) + ((frac_2.den / fac) * frac_1.num);
		frac_result.den := fac;
		return frac_result;
	end;

	function "-"(frac_1, frac_2 : T_Fraction) return T_fraction is
		fra_1 : T_Fraction;
	begin
		put("hello");
		return fra_1;
	end;

	function "*"(frac_1, frac_2 : T_Fraction) return T_fraction is
		fra_1 : T_Fraction;
	begin
		put("hello");
		return fra_1;
	end;

	function "*"(nb_entier : integer; frac : T_Fraction) return T_fraction is
		fra_1 : T_Fraction;
	begin
		put("hello");
		return fra_1;
	end;

	function "*"(frac : T_Fraction; nb_entier : integer) return T_fraction is
		fra_1 : T_Fraction;
	begin
		put("hello");
		return fra_1;
	end;

	function "/"(frac_1, frac_2 : T_Fraction) return T_fraction is
		fra_1 : T_Fraction;
	begin
		put("hello");
		return fra_1;
	end;

	function "/"(nb_entier : integer; frac : T_Fraction) return T_fraction is
		fra_1 : T_Fraction;
	begin
		put("hello");
		return fra_1;
	end;

	function "/"(frac : T_Fraction; nb_entier : integer) return T_fraction is
	begin
		put("hello");
		return (1,2);
	end;
end gestion_fractions;
