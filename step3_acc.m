clear all;

for i = 1:5
    ref{i} = load(['features/5/0' num2str(i) '_01.wav.txt']);
end

for i = 1:5
    for j = i
        test{i} = load(['features/5/0' num2str(i) '_02.wav.txt']);
        test{j} = load(['features/5/0' num2str(i) '_03.wav.txt']);
    gt1_23(i) = i;
    end
end

%for i = 1:5
%    test{i} = load(['features/5/0' num2str(i) '_03.wav.txt']);
%    gt13(i) = i;
%end

for i = 1:length(test)
    for j = 1:length(ref)
        [dist, d, D] = dtw(test{i}', ref{j}');
        dist1(i, j) = dist;
    end
end

[val, ind] = min(dist1');

cfm1_23 = confusionmat(gt1_23, ind);
acc1_23 = sum(diag(cfm1_23)) / sum(sum(cfm1_23))*100;

%cfm12 = confusionmat(gt12, ind);
%cfm13 = confusionmat(gt13, ind);

%acc12 = sum(diag(cfm12)) / sum(sum(cfm12))*100;
%acc13 = sum(diag(cfm13)) / sum(sum(cfm13))*100;