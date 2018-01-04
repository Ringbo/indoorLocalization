function [ ] = preStep(orient)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
global CURRENT_SETP;
global X;
global Y;
steps = 50;
CURRENT_SETP = CURRENT_SETP + 1;
if CURRENT_SETP == 1
    X(CURRENT_SETP) = steps*cos(orient);
    Y(CURRENT_SETP) = steps*sin(orient);
else
	X(CURRENT_SETP) = X(CURRENT_SETP-1)+steps*cos(orient);
    Y(CURRENT_SETP) = Y(CURRENT_SETP-1)+steps*sin(orient);
end

