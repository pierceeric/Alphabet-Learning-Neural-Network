function [a]=letgph(u)
%LETGPH Letter Graph
%       [a]=letgph(u)
%
%	Letgph is a function that takes a vector of length 35
%	and changes it to a 7x5 matrix that represents
%	an alphabetic character.  It then plots it.
%
%	u : Vector of length 35
%	a : 7x5 matrix representing alphabetic character

%  Wes Hines
%  The University of Tennessee
%  Copyright 1997

a=zeros(7,5);
a(1,1) = u(1);
a(1,2) = u(2);
a(1,3) = u(3);
a(1,4) = u(4);
a(1,5) = u(5);
a(2,1) = u(6);
a(2,2) = u(7);
a(2,3) = u(8);
a(2,4) = u(9);
a(2,5) = u(10);
a(3,1) = u(11);
a(3,2) = u(12);
a(3,3) = u(13);
a(3,4) = u(14);
a(3,5) = u(15);
a(4,1) = u(16);
a(4,2) = u(17);
a(4,3) = u(18);
a(4,4) = u(19);
a(4,5) = u(20);
a(5,1) = u(21);
a(5,2) = u(22);
a(5,3) = u(23);
a(5,4) = u(24);
a(5,5) = u(25);
a(6,1) = u(26);
a(6,2) = u(27);
a(6,3) = u(28);
a(6,4) = u(29);
a(6,5) = u(30);
a(7,1) = u(31);
a(7,2) = u(32);
a(7,3) = u(33);
a(7,4) = u(34);
a(7,5) = u(35);

% Define fill box edges.
x = [-.5 -.5 .5  .5 -.5];
y = [-.5  .5 .5 -.5 -.5];

% Set up figure axis.
cla reset
hold on
set(gca,'xlim',[0 5]+0.5);
set(gca,'ylim',[0 7]+0.5);

% Fill boxes.
for i=1:7
  for j=1:5
 	if a(i,j)==1 fill(j+x,8-i+y,'k'),end
   end
end
hold off

