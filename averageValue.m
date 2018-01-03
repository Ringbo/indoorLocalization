function [ output_args ] = averageValue(value,n)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global valueNum;
ave = 0;% ave局部
for i = 1:n
    ave = ave + value(i);
end
ave = ave/valueNum;
if (ave >= 8)
    ave =4.3;
else if (ave >= 7 && ave < 8)
        ave =3.3;
    else if (ave >= 4 && ave < 7)
            ave =2.3;
        else if (ave >= 3 && ave < 4)
                ave =2.0;
            else
                ave =1.7;
            end
        end
    end
end
output_args = ave;
return

end

