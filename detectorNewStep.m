function [ ] = detectorNewStep(values,t,i)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
global gravityOld;
global timeOfLastPeak;
global timeOfThisPeak;
global timeOfNow;
global ThreadValue;
global peakOfWave;
global valleyOfWave;
global initialValue;
global countPeak;
global orientOfLastPeak;
global orientOfNow;
global OrientDate;
if(gravityOld == 0)
    gravityOld = values;
else
    if(DetectorPeak(values,gravityOld))
        countPeak = countPeak+1;
        timeOfLastPeak = timeOfThisPeak;
        timeOfNow = t; %t应在文件数据中获取
        orientOfNow = i;
        if((timeOfNow - timeOfLastPeak >= 200)&&(peakOfWave - valleyOfWave >= ThreadValue) && (timeOfNow - timeOfLastPeak) <= 2000)
            timeOfThisPeak = timeOfNow;
            orient = CountOrient(orientOfLastPeak ,orientOfNow);
            orientOfLastPeak = orientOfNow;
            
            preStep(orient);
        end
        if((timeOfNow - timeOfLastPeak >= 200)&&(peakOfWave - valleyOfWave >= initialValue)) %此处>= 200后加了括号
            timeOfThisPeak = timeOfNow;
            ThreadValue = Peak_Valley_Thread(peakOfWave - valleyOfWave);
        end
    end
end
gravityOld = values;
end

