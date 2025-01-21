function xlpf = LPF(x)
%
%
persistent prevX
persistent firstRun


if isempty(firstRun)
    prevX = x;      %직전 추정값을 첫 측정 데이터로 초기화

    firstRun = 1;
end

%%필터 알고리즘
alpha = 0.7;            %가중치인 상수 알파는 임의로 지정
xlpf = alpha*prevX + (1 - alpha)*x;

prevX = xlpf;