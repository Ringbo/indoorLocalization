function [ ] = detectorNewStep(values,t)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global gravityOld;
global timeOfLastPeak;
global timeOfThisPeak;
global timeOfNow;
global ThreadValue;
global peakOfWave;
global valleyOfWave;
global initialValue;
global countPeak;
if(gravityOld == 0)
    gravityOld = values;
else
    if(DetectorPeak(values,gravityOld))
        countPeak = countPeak+1;
        timeOfLastPeak = timeOfThisPeak;
        timeOfNow = t; %tӦ���ļ������л�ȡ
        if((timeOfNow - timeOfLastPeak >= 200)&&(peakOfWave - valleyOfWave >= ThreadValue) && (timeOfNow - timeOfLastPeak) <= 2000)
            timeOfThisPeak = timeOfNow;
            preStep();
        end
        if((timeOfNow - timeOfLastPeak >= 200)&&(peakOfWave - valleyOfWave >= initialValue)) %�˴�>= 200���������
            timeOfThisPeak = timeOfNow;
            ThreadValue = Peak_Valley_Thread(peakOfWave - valleyOfWave);
        end
    end
end
gravityOld = values;
end

