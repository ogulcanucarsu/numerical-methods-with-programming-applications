% Gauus Elimination method
% x1 + 2x2 = -9
% 2x1 +x2 = 5
% 3x1 + 2x2 + x3 = 4
% Answer = x1 = 1, x2 = 3, x3 = -5 
clc; clear;
question = [1 0 2; 2 1 0; 3 2 1];
response = [-9; 5; 4];

[row,column] = size(question);

if row == column 
     disp('Kare Matris')
else 
    return;
end
question = [question,response]; 
k = 1; 
for i = 1:column 
    for j = i+1:column 
        if abs(question(j,i)) > abs(question(i,i))
            temp_row = question(i,:); 
            question(i,:) = question(j,:); 
            question(j,:) = temp_row; 
        end
    end
    if abs(question(i,i)) <= 5e-10
        question(i,i) = 0;
    end
    if question(i,i) ~= 1
        question(i,:) = question(i,:)./question(i,i);
    end
    for j = k:column-1
        l = question(j+1,k)/question(k,k);
        question(j+1,:) = question(j+1,:) - l*question(k,:);
    end
    k = k + 1; 
end

for i = 1:column
    for j = 1:column
        if abs(question(j,i)) <= 5e-10
            question(j,i) = 0;
        end
    end
end
UnaugmentedA = question;
UnaugmentedA(:,column+1) =  [];
Anan = isnan(UnaugmentedA);
ynan = (sum(Anan(:)==0))/column; 

z = all(UnaugmentedA == 0,2);
y = sum(z(:)==0); 
answer(column) = question(column,column+1)/question(column,column);
for i = column-1:-1:1
    counter = 0;
    for j = i+1:column 
        counter = counter + question(i,j)*answer(j); 
    end
    answer(i) = (question(i,column+1)-counter)/question(i,i);
end
answer'