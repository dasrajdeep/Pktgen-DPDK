clear
clc

SAMPLES_PER_SEC = 1000;
EXP_DURATION_SECS = 10;
TOTAL_SAMPLES = SAMPLES_PER_SEC * EXP_DURATION_SECS;
NUM_FIDS = 4;

figure
for i = 1:NUM_FIDS
    data = csvread(sprintf('halfway/activep4_latency_%d.csv', i - 1));
    data = data( : , 1) / 1000;
    cdfplot(data);
    hold on
end

xlim([0 10]);
xlabel('Latency (us)');
legend(cellstr(num2str([1:4]', ' FID=%-d '))');