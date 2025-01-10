clear all

dt = 0.2
t = 0:dt:10;

Nsamples = length(t)

Avgsaved = zeros(Nsamples, 1);
Xmsaved = zeros(Nsamples, 1);

for k=1:Nsamples
    xm = GetVolt();     %전압값 읽어오기
    avg = AvgFilter(xm);    %평균 필터 함수 호출

    Avgsaved(k) = avg;
    Xmsaved(k) = xm;
end


figure
plot(t, Xmsaved, 'r:*')
hold on
plot(t, Avgsaved, 'o-')
legend('Measured','Average')