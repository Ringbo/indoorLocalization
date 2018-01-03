function [ result ] = DetectorPeak(newValue,oldValue)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
global isDirectionUp;
global lastStatus;
global continueUpCount;
global continueUpFormerCount;
global minValue;
global maxValue;
global valleyOfWave;
global peakOfWave;
lastStatus = isDirectionUp;
if (newValue >= oldValue)
    isDirectionUp = true;
    continueUpCount = continueUpCount+1;
else
    continueUpFormerCount = continueUpCount;
    continueUpCount = 0;
    isDirectionUp = false;
end
 if (~isDirectionUp && lastStatus&& (continueUpFormerCount >= 2 && (oldValue >= minValue && oldValue < maxValue)))
     peakOfWave = oldValue;
     result = true;
     return
 else if(~lastStatus && isDirectionUp)
         valleyOfWave = oldValue;
         result = false;
         return
     else
         result = false;
         return
     end
 end
end

