# Lparser example file

recursion 20					
angle 10					
thickness 80					
min_thickness 5
switch_yz 1

axiom %C				

# Creature
rule C = %LABHT

# Body
rule B = [???????zZZZ]

# Arms
rule A = [zf&(90)"""[pj>(90)S]|[qj<(90)S]]
rule p = Ft+:'p					# left
rule q = Ft-:'q					# right
rule j = ;"j

# Scorpers
rule S = ['''!!r%^^r]
rule r = [Z?Z?Zu]				# jaw assembly
rule u = Z[co]!'^::u				# jaw and tooth	

# Legs
rule L = [c">(40)[s]>(40)[s]>(40)[s]>(40)[s]>(40)[s]>(40)[s]>(40)[s]>(40)[s]]
rule s = +++li+++dccc??""FF			# down legs
rule l = Ft+:'l					# upper leg
rule d = FFF'd					# lower leg
rule i = ;i

# Head
rule H = ["">(90)&(60)??FFFF!![???h][???k]%^^[??k]]
rule k = [Z?Z?Za]				# jaw assembly
rule a = Z[co]!'a				# jaw	
rule o = &(90)!!!!!F				# teeth
rule h = [^^gcccc"Z][^^ecccc"Z]			# eyes
rule g = z!+z!+z!+z				# left eye
rule e = z!-z!-z!-z				# right eye

# Tail
rule T = [f---------??""""""mccccF]
rule m = Ft+;'m					# curl
rule t = ['::c!!!&&[f<<<n]^^^^f>>>n]		# spikes
rule n = [c{--z++z++z--|--z++z++z}]		# leaf
