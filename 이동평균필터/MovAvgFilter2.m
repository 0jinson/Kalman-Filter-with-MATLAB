function avg = MovAvgFilter2(x)
%
%
persistent n xbuf
persistent firstRun

if isempty(firstRun)
	n = 10;                %데이터 개수 지정(10)
	xbuf = x*ones(n,1);    %내부 버퍼를 첫 데이터로 초기화
	
	firstRun = 1;
end


for m = 1:n-1
	xbuf(m) = xbuf(m+1);   %데이터 앞으로 한칸씩
end
xbuf(n) = x;             %새 데이터 값 추가

avg = sum(xbuf)/n;       %이동 평균 (배치식)