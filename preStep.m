function [ ] = preStep(orient)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

