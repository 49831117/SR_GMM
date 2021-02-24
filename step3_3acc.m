clear all;

for i = 1:5
    ref{i} = load(['features/5/0' num2str(i) '_03.wav.txt']);
end

for i = 1:5
    for j = i
        test{i} = load(['features/5/0' num2str(i) '_01.wav.txt']);
        test{j} = load(['features/5/0' num2str(i) '_02.wav.txt']);
    gt3_12(i) = i;
    end
end


for i = 1:length(test)
    for j = 1:length(ref)
        [dist, d, D] = dtw(test{i}', ref{j}');
        dist1(i, j) = dist;
    end
end

[val, ind] = min(dist1');

cfm3_12 = confusionmat(gt3_12, ind);
acc3_12 = sum(diag(cfm3_12)) / sum(sum(cfm3_12))*100;
