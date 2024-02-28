% Eric Pierce 25 Nov 2022 University of North Dakota
% Derived from alphabet-example.m by Wes Hines University of Tennessee

% This program requires the bprop2, letgph and logistic functions.
% AlphabetTrainingMatrix.txt and AlphabetTargetMatrix.txt must be  
% available for this program to use.

% V.4 Increases the output to 5-bits from 4-bits, this allows
% 32 total characters, instead of 16 characters.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Backpropagation used to recognize the alphabet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% In this example a neural network is 
% trained to recognize the letters of the 
% alphabet.  The letters are defined on a 5x7 
% template and are each stored as a vector 
% of length 35 in the AlphabetTrainingMatrix.txt file. 
% The data file contains an input matrix x (size = 35 by 32) 
% and a target matrix t (size = 5 by 32).  
% The entries in a column of the t matrix are a binary 
% coding of the letter of the alphabet in 
% the corresponding column of x.  The 
% columns in the x matrix are the indices 
% of the filled in boxes of the 5x7 template.  
% A function letgph() displays the letter on 
% the template.  For example, to plot the letter 
% A which is the first letter of the alphabet 
% and identified by t=[0 0 0 0 0], we load the 
% data file and plot the first column of x.

clc;
clear;
close all;

x = readmatrix('AlphabetTrainingMatrix.txt');
t = readmatrix('AlphabetTargetMatrix.txt'); 

% We will now train a neural network to identify a letter.  
% The network has 35 inputs corresponding to the boxes in the 
% template and has 5 outputs corresponding 
% to the binary code of the letter.  Since 
% the outputs are binary, we can use a logistic 
% output layer.  The function bprop2 has a 
% logistic/logistic architecture.  We will 
% use a beginning learning rate of 0.5, 
% train to a maximum of 5,000 cycles and 
% a root mean squared (RMS) error goal of 0.01.  

W1 = 0.5*randn(10,36); % Initialize output layer (10x36) weight matrix.
W2 = 0.5*randn(5,11);  % Initialize hidden layer (5x11) weight matrix.
RMS_Goal = 0.01;       % Backpropogation RMS error goal.
lr = 0.5;              % Learning Rate.
maxcycles = 500;      % Maximum number of backpropogation iterations.

[W1 W2 RMS]=bprop2(x,t,W1,W2,RMS_Goal,lr,maxcycles); % (input, target, 
               % hidden-layer, weight, output-layer weight, RMS goal, 
               % learning rate, maximum iterations)  
               % Trains a two-layer multilayer perceptron 
               % with the batch backpropagation algorithm

semilogy(RMS); % Creates linear-x, log10-y graph of RMS errors.
title('Backpropagation Training');
xlabel('Cycles');
ylabel('Root Mean Squared Error')

% W1 and W2 have been trained to contain the alogrithm for determining
% which character the presented character represents.
% When the original "perfect" letters are injected into the alogrithm,
% the characters are all interpreted correctly as shown in the section 
% of code below.

fprintf('This section shows the level of learning for all characters\n');
outputA0   = logistic(W2*[1;logistic(W1*[1;x(:,1)])])';  % letter A
outputB1   = logistic(W2*[1;logistic(W1*[1;x(:,2)])])';  % letter B
outputC2   = logistic(W2*[1;logistic(W1*[1;x(:,3)])])';  % letter C
outputD3   = logistic(W2*[1;logistic(W1*[1;x(:,4)])])';  % letter D
outputE4   = logistic(W2*[1;logistic(W1*[1;x(:,5)])])';  % letter E
outputF5   = logistic(W2*[1;logistic(W1*[1;x(:,6)])])';  % letter F
outputG6   = logistic(W2*[1;logistic(W1*[1;x(:,7)])])';  % letter G
outputH7   = logistic(W2*[1;logistic(W1*[1;x(:,8)])])';  % letter H
outputI8   = logistic(W2*[1;logistic(W1*[1;x(:,9)])])';  % letter I
outputJ9   = logistic(W2*[1;logistic(W1*[1;x(:,10)])])'; % letter J
outputK10  = logistic(W2*[1;logistic(W1*[1;x(:,11)])])'; % letter K
outputL11  = logistic(W2*[1;logistic(W1*[1;x(:,12)])])'; % letter L
outputM12  = logistic(W2*[1;logistic(W1*[1;x(:,13)])])'; % letter M
outputN13  = logistic(W2*[1;logistic(W1*[1;x(:,14)])])'; % letter N
outputO14  = logistic(W2*[1;logistic(W1*[1;x(:,15)])])'; % letter O
outputP15  = logistic(W2*[1;logistic(W1*[1;x(:,16)])])'; % letter P
outputQ16  = logistic(W2*[1;logistic(W1*[1;x(:,17)])])'; % letter Q
outputR17  = logistic(W2*[1;logistic(W1*[1;x(:,18)])])'; % letter R
outputS18  = logistic(W2*[1;logistic(W1*[1;x(:,19)])])'; % letter S
outputT19  = logistic(W2*[1;logistic(W1*[1;x(:,20)])])'; % letter T
outputU20  = logistic(W2*[1;logistic(W1*[1;x(:,21)])])'; % letter U
outputV21  = logistic(W2*[1;logistic(W1*[1;x(:,22)])])'; % letter V
outputW22  = logistic(W2*[1;logistic(W1*[1;x(:,23)])])'; % letter W
outputX23  = logistic(W2*[1;logistic(W1*[1;x(:,24)])])'; % letter X
outputY24  = logistic(W2*[1;logistic(W1*[1;x(:,25)])])'; % letter Y
outputZ25  = logistic(W2*[1;logistic(W1*[1;x(:,26)])])'; % letter Z

AlphabetTrainingOutput = vertcat(outputA0,outputB1,outputC2,outputD3,...
    outputE4, outputF5, outputG6, outputH7, outputI8, outputJ9,...
    outputK10, outputL11, outputM12, outputN13, outputO14, outputP15,...
    outputQ16, outputR17, outputS18, outputT19, outputU20, outputV21,...
    outputW22, outputX23, outputY24, outputZ25)

% The network correctly identifies each of 
% the test cases.  You can verify this by 
% comparing each output with its binary equivalent.  
% For example, output7 should be [0 0 1 1 1], 
% which is very close to its actual output.

pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Noisy Inputs Entered into Alogrithm %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A neural network's ability to generalize is 
% found in its ability to give a correct 
% response to an input that was not in the 
% training set.  For example, a noisy input 
% of an A may look like:

fprintf('--------------------------------------------------\n');
fprintf('When given the messy letter shown in the Figure.\n');
messy_a=[0 0 1 0 0 0 0 0 1 0 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 1 1]';
letgph(messy_a);  
title('Messy A');
Output = logistic(W2*[1;logistic(W1*[1;messy_a])])'
fprintf('This output is very close to the binary pattern [0 0 0 0 0],\n');
fprintf('which designates an A.\n');
fprintf('This shows the networks ability to generalize,\n');
fprintf('and more specifically, its tolerance to noise.\n\n');

pause
fprintf('--------------------------------------------------\n');
fprintf('When given another messy letter shown in the Figure.\n');
messy_b=[1 1 1 1 0 1 0 0 0 0 1 0 0 0 1 1 1 1 1 1 1 0 1 0 1 1 0 0 0 1 1 0 1 1 0]';
letgph(messy_b);  
title('Messy B');
Output = logistic(W2*[1;logistic(W1*[1;messy_b])])'  
fprintf('This output is close to the binary pattern [0 0 0 0 1],\n');
fprintf('which designates an B.\n\n');

pause
fprintf('--------------------------------------------------\n');    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% User Created Character Entered %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('Create a letter using a 7 x 5 grid.\n')
fprintf('  1  2  3  4  5 \n');
fprintf('  6  7  8  9  10\n');
fprintf('  11 12 13 14 15\n');
fprintf('  16 17 18 19 20\n');
fprintf('  21 22 23 24 25\n');
fprintf('  26 27 28 29 30\n');
fprintf('  31 32 33 34 35\n\n');
fprintf('Type the number of cells you would like filled, into a matrix.\n')
fprintf('For example, "O" is indicated with:\n')
fprintf('[2 3 4 6 10 11 15 16 20 21 25 26 30 32 33 34]\n\n')
prompt ="Type the matrix description of your character.\n";
MysteryCharacter = input(prompt);

% Convert MysteryCharacter to 35x1 binary matrix.
CharLength = length(MysteryCharacter); % Find length of matrix.
YourCharacter = zeros(35,1); % create 35x1 matrix of zeros.
for index = 1:CharLength
    a = MysteryCharacter(index);
    YourCharacter(a)=1; % replace a-th element of YourCharacter with a 1.
end

letgph(YourCharacter);  % Function to draw character
title('Your Character');

% Determine most likely letter.
Output = logistic(W2*[1;logistic(W1*[1;YourCharacter])])'  

% Round the output matrix to binary to determine the output character.
rounded_output = round(Output);
n1 = rounded_output(1); % first element of rounded_output vecor 
n2 = rounded_output(2); % second element of rounded_output vecor
n3 = rounded_output(3); % third element of rounded_output vecor
n4 = rounded_output(4); % fourth element of rounded_output vecor
n5 = rounded_output(5); % fifth element of rounded_output vecor

% Convert binary matrix to decimal value
decimal_character = 16*n1 + 8*n2 + 4*n3 + 2*n4 + n5;
character_matrix = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M'...
    'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' 'empty' 'empty'...
    'empty' 'empty' 'empty' 'empty'];
character = character_matrix(decimal_character + 1);
fprintf('Your character is an %c. \n', character);
