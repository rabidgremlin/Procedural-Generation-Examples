# bekerplant.ls by C.J. van der Mark        
 
recursion 6
angle 17
thickness 300
min_thickness 2
shape 1
switch_yz 1

axiom X>(45)X>(45)X>(45)X>(45)X>(45)X>(45)X>(45)X

rule X = [FFFFFF&(30)FFAYZ] 
rule Y = [h+B[+EEEEEE[h+CiDiD][h-CiDiD]][h-EEEEEE[h+CiDiD][h-CiDiD]]]
rule Z = [h-B[+EEEEEE[h+CiDiD][h-CiDiD]][h-EEEEEE[h+CiDiD][h-CiDiD]]]
rule A = aEA 
rule B = EbEbB
rule C = aGaGaGaGaGaGaGatGtGC
rule D = bHD
rule a = &(6)
rule b = ^(9)
rule F = ?(0.98)'(0.993)F
rule h = ~(6)
rule i = ?(0.94)i
rule E = c(2)F[+(40)^(60)?(0.05)'(4)c(8)F][-(40)^(60)?(0.05)'(4)c(8)F]
rule G = c(2)F[+(40)^(60)?(0.03)'(2)c(8)F][-(40)^(60)?(0.03)'(2)c(8)F]
rule H = c(2)F[+(40)^(60)?(0.02)'(1)c(8)F][-(40)^(60)?(0.02)'(1)c(8)F]
