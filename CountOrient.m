function [ orient ] = CountOrient( last , now)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global OrientDate;
average = 0;
    data = OrientDate(last:now,:);
    %plot(data,'r');
    hold on;
    dataSmooth = smooth(data,'moving');
    %plot(dataSmooth,'b');
    for i = 1:now-last
        average = average + dataSmooth(i);
    end
    average = average /(now - last);
    orient = average;
end

