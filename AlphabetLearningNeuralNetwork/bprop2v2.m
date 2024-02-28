function [W1,W2,RMS]=bprop2(x,t,W1,W2,RMS_Goal,lr,maxcycles)
%BPROP2 Train 2 Layer (logistic/Logistic) Neural Network  
%	[W1,W2,RMS]=bprop2(x,t,W1,W2,RMS_Goal,lr,maxcycles)
%
%	This function trains a two layer multilayer layer perceptron
%	with the batch backpropagation algorithm.  The MLP has a logistic
%	hidden layer with a logistic output layer.
%
%	x    	  : Input matrix.
%	t    	  : Target matrix.
%	W1   	  : The hidden layer weight matrix.	
%	W2   	  : The output layer weight matrix.
%	RMS_Goal  : Root Mean Squared Error goal.
%	lr   	  : Learning rate.
%	maxcycles : Maximum number of training iterations.
%
%  Original code by:
%  Wes Hines
%  The University of Tennessee
%  Copyright 1997

[inputs,patterns1]=size(x);
[outputs,patterns]=size(t);
[hidden,inputs1]=size(W1);
[outputs1,hidden1]=size(W2);

if outputs1 ~= outputs
	error('Weight dimension of W1 does not match the target vector.')
end

if inputs1 ~= inputs+1
	error('Weight dimension of W2 does not match the input vector.')
end

if hidden1 ~= hidden+1
	error('Weight dimension of W1 and W2 does not coincide.')
end

terms=outputs*patterns;
RMS=zeros(1,maxcycles);
X=[ones(1,patterns); x];		% Augment inputs with bias dummy node.

for i=1:maxcycles
	h=logistic(W1*X);
	H=[ones(1,patterns);h];		% Hiden layer output
	output = logistic(W2*H);	% Output Vector		
	e = t-output;			    % Output Error
	RMS(i) = sqrt(sum(sum(e.^2))/terms);	% Root mean squared error.	
	if RMS(i)<RMS_Goal; 
        break;
    end

	if RMS(i)<=RMS(max((i-1),1)) lr=lr*1.1;  % Adaptive learning rate.
	else	lr=lr*.1;
    end
   
	delta2= output.*(1-output).*e;
	del_W2= 2*lr* delta2*H';
	delta1 = h.*(1-h).*(W2(:,2:hidden+1)'*delta2);
	del_W1 = 2*lr*delta1*X';
	W1 = W1+del_W1;			% Hidden layer weight update.
	W2 = W2+del_W2;			% Output layer weight update
	

end
RMS=nonzeros(RMS);
