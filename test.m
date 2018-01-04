clear;
clc;
global isDirectionUp;isDirectionUp = false;
global lastStatus;lastStatus = false;
global continueUpCount;continueUpCount = 0;
global continueUpFormerCount;continueUpFormerCount = 0;
global minValue;minValue = 11.0;
global maxValue;maxValue = 19.6;
global valleyOfWave;valleyOfWave = 0;
global ThreadValue;ThreadValue = 2.0;
global tempCount;tempCount = 1;
global valueNum;valueNum = 5;
global initialValue;initialValue = 1.7;
global tempValue;tempValue = linspace(0,0,valueNum);
global gravityOld;gravityOld = 0;
global timeOfLastPeak;timeOfLastPeak = 0;
global timeOfThisPeak;timeOfThisPeak = 0;
global timeOfNow;timeOfNow = 0;
global CURRENT_SETP;CURRENT_SETP = 0; %存储当前步数信息
global peakOfWave;peakOfWave = 0;
global countPeak;countPeak = 0;
global dataConStr;
global orientOfLastPeak;orientOfLastPeak = 1;
global orientOfNow;orientOfNow = 0;
global OrientDate;
global X;X = zeros(300,1);
global Y;Y = zeros(300,1);
dataNum = 1;
for i = 1:dataNum
    dataConStr = 'AcceleValues/input_'; 
    dataConStr = strcat(dataConStr,num2str(i));%转字符串
    AccleDate = importdata(strcat(dataConStr, '/Accledate.txt'));
    OrientDate = importdata(strcat(dataConStr, '/Direcdate.txt'));
    Acctime = int64(AccleDate(:,1));
    x = AccleDate(:,2);
    y = AccleDate(:,3);
    z = AccleDate(:,4);
    average = sqrt(power(x,2)+power(y,2)+power(z,2));
    %plot(average)
    hold on
    
    % averageSmooth = smooth(average,'rlowess');
    % SIZE = size(Acctime);
    % SIZE = SIZE(1);
    % for i = 1:SIZE
    %     detectorNewStep(averageSmooth(i),Acctime(i))
    % end
    
    fOutput = fopen([dataConStr,'/result.txt'],'w+');
    fclose('all');
%     averageSmooth = smooth(average,'moving');
%     OutputResult(averageSmooth,'moving',Acctime); 
    averageSmooth = smooth(average,'lowess');
    OutputResult(averageSmooth,'lowess',Acctime);
    
%     averageSmooth = smooth(average,'sgolay');
%     OutputResult(averageSmooth,'sgolay',Acctime);
%     
%     averageSmooth = smooth(average,'rlowess');
%     OutputResult(averageSmooth,'rlowess',Acctime);
%     
%     averageSmooth = smooth(average,'rloess');
%     OutputResult(averageSmooth,'rloess',Acctime);
for i = 1:CURRENT_SETP
    %plot(X(i),Y(i),'*');
end

end





