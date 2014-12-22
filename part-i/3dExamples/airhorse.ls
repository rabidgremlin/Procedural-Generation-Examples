# Lparser example file

recursion 20					
angle 10					
thickness 200					
min_thickness 5
shape 1
switch_yz 1

axiom C

# Creature
rule C = LBW

# Body
rule B = [[''aH]|[g]]
rule a = Fs+;'a 				# upper part
rule g = Ft+;'g					# lower part
rule s = [::cc!!!!&&[FFcccZ]^^^^FFcccZ]		# upper spikes
rule t = [c!!!!&[FF]^^FF]			# lower spikes

# Lungs
rule L = O					# 8 recursions delay
rule O = P
rule P = Q
rule Q = R
rule R = U
rule U = X
rule X = Y
rule Y = V
rule V = [cc!!!&(90)[Zp]|[Zp]]
rule p = h>(120)h>(120)h
rule h = [+(40)!F'''p]

# Head
rule H = [cccci[>(50)dcFFF][<(50)ecFFF]]
rule d = Z!&Z!&:'d				# left
rule e = Z!^Z!^:'e				# right
rule i = -:"i

# Wing
rule W = [%[!!cb][<<<!!cb][>>>!!cb]]
rule b = Fl!+Fl+;'b				# arc
rule l = [-cc{--z++z++z--|--z++z++z}]
