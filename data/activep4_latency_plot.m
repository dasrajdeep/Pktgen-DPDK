clear
clc

SAMPLES_PER_SEC = 1000;
EXP_DURATION_SECS = 10;
NUM_FIDS = 4;

plot_data = zeros(EXP_DURATION_SECS, NUM_FIDS);

for i = 1:NUM_FIDS
    data = csvread(sprintf('activep4_latency_%d.csv', i - 1));
    data = data / 1000;
    for t = 1:EXP_DURATION_SECS
        plot_data(t, i) = median( data( (t - 1) * SAMPLES_PER_SEC + 1 : t * SAMPLES_PER_SEC ) );
    end
end

figure
area(plot_data);
xlabel('Time (seconds)');
ylabel('Latency (us)');
legend(cellstr(num2str([1:4]', ' FID=%-d '))');