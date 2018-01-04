function [ orient ] = CountOrient( last , now)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
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

