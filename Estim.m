function y_es=Estim(z)
fismat = readfis('Es.fis');
y_es = evalfis(z,fismat);
