%En Küçük Kareler Yöntemi (Least-Squares Method)
%Derste verilen örnekler
%0 2 3 5 8
%-6 0 7 21 65
%-----------
%0 1 2 4 7
%1 5 8 13 21
clc;
clear;
close all;
degrees=input('Fonksiyonun derecesini belirleyiniz  atayınız derece = ');
if degrees >= 1
    firstFunction = [0 2 5 9 15 25 40];
    secondFunction = [5 12 23 37 44 60 81];
    firstMatrix = ones(degrees+1,degrees+1);
    secondMatrix = ones(degrees+1, 1);
    for i = 1:degrees+1
    for j = 1:degrees+1
        if i == 1 && j == 1
            firstMatrix(i,j) = length(firstFunction);
        else
            if i == 1
               firstMatrix(i,j) = sum(firstFunction.^(j-1)); 
            else
                firstMatrix(i,j) = sum(firstFunction.^(i+j-2)); 
            end
        end
        
    end
    end

    for k = 1:degrees+1
        if k == 1
         secondMatrix(k,1) = sum(secondFunction);
        else
         secondMatrix(k,1) = sum((firstFunction.^(k-1)).*secondFunction);
        end
    end

    multipliy = inv(firstMatrix)*secondMatrix;   
    fx = NaN;
    for degree = 1:degrees+1
        if degree == 1
            fx = multipliy(1,1);
        else
            fx = fx + multipliy(degree,1)*(firstFunction.^(degree-1));
        end
    end
    plot(firstFunction,secondFunction,'k o',firstFunction,fx,'r')
    legend('Verilen','Hesaplanan')
else
    disp('Derece minimum 1 olabilir.')   
end
