function [ output_args ] = OutputResult( CurAverage,way,Acctime)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global timeOfThisPeak;timeOfThisPeak = 0;%need
global dataConStr;
global CURRENT_SETP;CURRENT_SETP = 0; %�洢��ǰ������Ϣ
%step = importdata('AcceleValues/data.txt');
%fOutput = fopen('AcceleValues/result.txt','a+');
step = importdata([dataConStr,'/data.txt']);
fOutput = fopen([dataConStr,'/result.txt'],'a+');

SIZE = size(Acctime);
SIZE = SIZE(1);
for i = 1:SIZE
    detectorNewStep(CurAverage(i),Acctime(i),i)
end
rate = double(abs(CURRENT_SETP - step)/step);
fprintf(fOutput,'%s:%g Deviation rate:%g%%\r\n',way,CURRENT_SETP,rate*100);
fclose('all');
CURRENT_SETP
end

