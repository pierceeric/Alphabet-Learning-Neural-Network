function [y] = logistic(x);
%LOGISTIC Logistic Activation Function
% 	  [y] = logistic(x)
%
%	  Returns the result of applying the logistic operator 
%	  to the input x.
%
%	  x : the input
%	  y : the logistic function of each of the inputs
%

%  Wes Hines
%  The University of Tennessee
%  Copyright 1997

y=1./(1+exp(-x));




