function avg = AvgFilter(x)

%%함수 초기화
%직전 평균값, 데이터 개수는 함수 종료돼도 보관
persistent prevAvg k    
persistent firstRun

%함수가 처음 호출될 때 한번만 실행
if isempty(firstRun)
    k = 1;
    prevAvg = 0;

    firstRun = 1;
end
%
%%

%평균 필터 구현
alpha = (k-1) / k;
avg = alpha*prevAvg + (1 - alpha) * x;

prevAvg = avg;
k = k + 1;