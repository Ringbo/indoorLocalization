function [ output_args ] = Peak_Valley_Thread(value)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global ThreadValue;
global tempCount;
global valueNum;
global tempValue;
tempThread = ThreadValue; %tempThread为局部变量
if (tempCount < valueNum)
    tempValue(tempCount) = value;
    tempCount = tempCount+1;
else
    tempThread = averageValue(tempValue, valueNum);
    for i = 2:valueNum
        tempValue(i - 1) = tempValue(i);
    end
    tempValue(valueNum - 1) = value;
end
output_args = tempThread;
return

end

