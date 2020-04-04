% Gauus Elimination method
% x1 + 2x2 = -9
% 2x1 +x2 = 5
% 3x1 + 2x2 + x3 = 4
% Answer = x1 = 1, x2 = 3, x3 = -5 

clc; clear;
question = [1 0 2; 2 1 0; 3 2 1]
result = [-9; 5; 4]

[sizeRow1,sizeRow2] = size(question);
    for i=1:1:sizeRow1
        question(i,sizeRow2+1)=-1*result(i,1);
    end
scale = question(1,1);
question(1,:)=(1/scale)*question(1,:);
add=0;
counter = 1;
while counter < sizeRow1 
    for i=2+add:1:sizeRow1 
        c=question(i,1+add); 
        for j=1+add:1:sizeRow2 
            question(i,j)=question(i,j)-c*question(1+add,j);
        end
        if i==sizeRow1
            add = add +1;
            scale = question(1+add,1+add);
            question(1+add,:)=(1/scale)*question(1+add,:);
        end
    end
    counter = counter +1;
end
counter = 0;
for i=sizeRow1:-1:1 
    for j=sizeRow2:-1:sizeRow2-counter 
        question(i,j)=-1*question(i,j);
    end
    counter = counter +1;
end

for i=1:1:sizeRow1
    questionYLine(i,1)=question(i,sizeRow2);
end
question(:,sizeRow2)=[];
answer = zeros(1,sizeRow1);
answer(1,sizeRow1)=questionYLine(sizeRow1,1);
[sizeRow1,sizeRow2] = size(question);

counter = 0;
for i=sizeRow1-1:-1:1  
    for j=sizeRow2:-1:sizeRow2-counter
        question(i,j)=question(i,j)*answer(1,j);
    end
    for k=sizeRow2:-1:sizeRow2-counter
        answer(1,i)=answer(1,i)+question(i,k);
    end
    answer(1,i)=answer(1,i)+questionYLine(i,1);
    counter = counter +1;
end
answer