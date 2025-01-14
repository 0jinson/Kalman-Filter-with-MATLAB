function avg = MovAvgFilter(x)
%
%
persistent prevAvg n xbuf
persistent firstRun


if isempty(firstRun)
	n = 10;                     %데이터 개수 지정(10)
	xbuf = x*ones(n+1,1);       %내부 버퍼를 첫 데이터로 초기화

	k = 1;
	prevAvg = x;

	firstRun = 1;
end

for m = 1:n
	xbuf(m) = xbuf(m+1);        %데이터 앞으로 한칸씩
end
xbuf(n+1) = x;                %새 데이터 값 추가

avg = prevAvg + (x- xbuf(1)) / n; %이동 평균 재귀식


prevAvg = avg;       %이전 평균값 최신화