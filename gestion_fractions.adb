With Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

package body gestion_fractions is

package Math is new Ada.Numerics.Generic_Elementary_Functions(Float); use Math;
	
	function Calc(S : in String) return integer is
	begin
		if S = "+" then
			return 1;
		elsif S = "-" then
			return 2;
		--elsif S = "*" then
		--	return 3;
		elsif S = "x" then
			return 3;
		elsif S = "/" then
			return 4;
		elsif S = "p" then
			return 5;
		-- elsif S = "**" then
		-- 	return 5;
		elsif S = "PGCD" then
			return 6;
		elsif S = "pgcd" then
			return 6;
		else
			Put_line(S);
			raise FAUX_CALCUL;
			return 0;
		end if;
	end Calc;
	
	function integer_to_frac(i : integer) return T_Fraction is
	begin
		return (i, 1);
	end;

	function Est_Numerique_Int(S : in String) return Boolean is
     	Temp : Integer;
   	begin
	      Temp := Integer'Value (S);
	      return True;
   	exception
      	when others =>	return False;
   end Est_Numerique_Int;

	procedure verif_frac(num, den : in out integer) is
	begin
		if(den < 0) then
			den := den * (-1);
			num := num * (-1);
		elsif(den = 0) then
			raise DIV_PAR_ZERO;
		end if;
	end;

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
		loop
			begin
				Put("Entrer le numérateur de la fraction : ");
				get(num);
				Put("Entrer le dénumérateur de la fraction : ");
				get(den);

				verif_frac(num, den);

				frac.num := num;
				frac.den := den;
				exit;

			exception 
				when DIV_PAR_ZERO => Put_line("vous avez entré un dénumérateur nul ceci est impossible, réessayer");
			end;
		end loop;
		

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
		fac : natural := 0;
	begin
		fac := PPMC(frac_1.den, frac_2.den);
		return reduire((((fac / frac_1.den) * frac_1.num) + ((fac / frac_2.den) * frac_2.num), fac));
	end;

	function "-"(frac_1, frac_2 : T_Fraction) return T_fraction is
	begin
		return frac_1 + ((-1)*frac_2);
	end;

	function "*"(frac_1, frac_2 : T_Fraction) return T_fraction is
	begin
		return reduire((frac_1.num * frac_2.num, frac_1.den * frac_2.den));
	end;

	function "*"(nb_entier : integer; frac : T_Fraction) return T_fraction is
	begin
		return reduire("*"((nb_entier,1),frac));
		--return reduire((nb_entier * frac.num, frac.den));
	end;

	function "*"(frac : T_Fraction; nb_entier : integer) return T_fraction is
	begin
		return reduire((nb_entier * frac.num, frac.den));
	end;

	-- function puissance(frac : T_Fraction; nb_entier : integer) return T_fraction is
	-- begin
	-- 	if nb_entier < 0 then
	-- 		return reduire((frac.den ** (nb_entier*(-1)), frac.num ** (nb_entier*(-1))));	
	-- 	elsif nb_entier = 0 then
	-- 		return reduire((1, 1));	
	-- 	else
	-- 		return reduire((frac.num ** nb_entier, frac.den ** nb_entier));	
	-- 	end if;
	-- end;

	function "**"(frac, exposant : T_Fraction) return T_fraction is
		tmp_frac : T_Fraction := exposant;
	begin
		if tmp_frac.num < 0 then
			return (integer(float(frac.den)**(float(abs(tmp_frac.num)) / float(abs(tmp_frac.den)))), integer(float(abs(frac.num))**(float(abs(tmp_frac.num)) / float(abs(tmp_frac.den)))));
		elsif tmp_frac.num = 0 then
			return reduire((1, 1));	
		else
			return (integer(float(frac.num)**(float(tmp_frac.num) / float(tmp_frac.den))), integer(float(frac.den)**(float(tmp_frac.num) / float(tmp_frac.den))));	
		end if;
	end;

	function "/"(frac_1, frac_2 : T_Fraction) return T_fraction is
	begin
		if frac_2.num /= 0 and frac_2.den /= 0 then
			return reduire((frac_1.num * frac_2.den, frac_1.den * frac_2.num));
		else
			raise DIV_PAR_ZERO;
		end if;
	end;

	function "/"(nb_entier : integer; frac : T_Fraction) return T_fraction is
	begin
		return reduire((nb_entier, 1) / frac);
	end;

	function "/"(frac : T_Fraction; nb_entier : integer) return T_fraction is
	begin
		return reduire(frac / (nb_entier, 1));
	end;

	function cal_frac_command_line(operation : positive; tmp_frac_1, tmp_frac_2 : T_fraction) return T_fraction is
		tmp_frac : T_fraction;
	begin
		case operation is
			when 1 => 	tmp_frac := tmp_frac_1 + tmp_frac_2;
						return reduire(tmp_frac);
			when 2 => 	tmp_frac := tmp_frac_1 - tmp_frac_2;
						return reduire(tmp_frac);
			when 3 => 	tmp_frac := tmp_frac_1 * tmp_frac_2;
						return reduire(tmp_frac);
			when 4 => 	tmp_frac := tmp_frac_1 / tmp_frac_2;
						return reduire(tmp_frac);
			when 5 => 	tmp_frac := tmp_frac_1 ** tmp_frac_2;
						return reduire(tmp_frac);
			when 6 =>	return reduire((PGCD(tmp_frac_1.num, tmp_frac_2.num), 1));	
			when others => raise FAUX_CALCUL;
						
				
		end case;
	end;

	procedure command_line is 
		b_temp_num, b_temp_den : boolean := true;
		temp_num, temp_den,i,j, d_boucle, f_boucle : integer := 0;
		fraction : T_Fraction;
		tab_fractions : array (0..1) of T_fraction;
	begin
		for i in 1..Argument_Count loop
			if not(Est_Numerique_Int(Argument(i))) and i > 1 then
	      		for k in 0 .. 1 loop
	      			temp_num := 0;
	  				temp_den := 0;
	  				b_temp_num := true;
	  				b_temp_den := true;
	  				j := k;

	  				if k = 0 then
	  					d_boucle := 1;
	  					f_boucle := i-1;
	  				else
	  					d_boucle := i + 1;
	  					f_boucle := Argument_Count;
	  				end if;
	      			
      				for y in d_boucle .. f_boucle loop
						if Est_Numerique_Int(Argument(y)) and b_temp_num then
						   temp_num := integer'Value(Argument(y));
						   b_temp_num := false;
						elsif Est_Numerique_Int(Argument(y)) and b_temp_den then
							temp_den := integer'Value(Argument(y));
							b_temp_den := false;verif_frac(temp_num, temp_den);
						end if;     			
	      			end loop;

	      			if b_temp_den then
	      				temp_den := 1;
	      			end if;

	      			fraction.num := temp_num;
	      			fraction.den := temp_den;

	      			tab_fractions(j) := fraction;
	      		end loop;

	      		fraction := cal_frac_command_line(Calc(Argument(i)), tab_fractions(0), tab_fractions(1));
      		end if;
   		end loop;
   		put(fraction);
	end command_line;

end gestion_fractions;
