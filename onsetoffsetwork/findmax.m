close all
load('PY12N005_07_07_2012_21-46-37_659sec.mat')




[s,f,t] = getspectrogram(eeg(1,:));
%use proper spectrogram function

%{
%hold on
[B,C] = sort(s,'descend');
%Calculate Power of result



x = sum(B(1:10,:))/10;
times = 1:.1:max(t);
Train = NewTrain(t,x,4,times);

plot(t,x);
hold on
plot(times,Train./2)
%}


power = zeros(size(t));
for i = 1:size(t)
    coeffs = s(:,i);
    power(i) = sum(coeffs.*f);
end


plot(t,power)