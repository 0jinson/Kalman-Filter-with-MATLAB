clear all

Nsamples = 500;                %데이터 개수 (500개)
Xsaved = zeros(Nsamples, 1);
Xmsaved = zeros(Nsamples, 1);


for k = 1:Nsamples
	xm = GetSonar();             %초음파 거리계 측정값 읽어오기
	x = MovAvgFilter(xm);        %이동평균 필터 함수 호출
	
	Xsaved(k) = x;
	Xmsaved(k) = xm;
	%읽어온 데이터와 이동평균값 행렬에 저장
	
end

dt = 0.02;                   %측정값 간격(0.02초)
t = 0:dt:Nsamples*dt-dt      %총 시간을 dt 간격으로

figure
hold on
plot(t, Xmsaved, 'r.');
plot(t, Xsaved, 'b');
legend('Measured', 'Moving average')
