% Gauus Elimination method
% x1 + 2x2 = -9
% 2x1 +x2 = 5
% 3x1 + 2x2 + x3 = 4
% Answer = x1 = 1, x2 = 3, x3 = -5 
clc; clear;
question = [1 0 2; 2 1 0; 3 2 1];
response = [-9; 5; 4];
len = length(question);
for j = 1:(len-1)
    for i = len:-1:j+1
        section = question(i,j)/question(j,j);
        question(i,:) = question(i,:) - section*question(j,:);
        response(i) = response(i) - section*response(j);
    end
end 

reverseAnswer = zeros(len,1);
reverseAnswer(len) = response(len)/question(len,len);               
for i = len-1:-1:1                    
    sum = 0;
    for j = len:-1:i+1                
        sum = sum + question(i,j)*reverseAnswer(j);    
    end 
    reverseAnswer(i) = (response(i)- sum)/question(i,i);
end 
disp('method:');
answer = reverseAnswer';
answer