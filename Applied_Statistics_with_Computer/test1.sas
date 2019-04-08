data input_data;
  input n _time @@;
  
cards;
500 0.014 500 0.014 500 0.014 500 0.014 
1000 0.054 1000 0.054 1000 0.057 1000 0.057 
1500 0.125 1500 0.131 1500 0.136 1500 0.123 
2000 0.219 2000 0.227 2000 0.222 2000 0.234 
2500 0.355 2500 0.357 2500 0.358 2500 0.350 
3000 0.522 3000 0.508 3000 0.506 3000 0.504 
;
run;

proc anova data = input_data;
  class n;
  model _time = n;
  means n / hovtest=BARTLETT LSD cldiff lines alpha = 0.1;
run; 

proc reg data = input_data;
  model _time = n;
run;
