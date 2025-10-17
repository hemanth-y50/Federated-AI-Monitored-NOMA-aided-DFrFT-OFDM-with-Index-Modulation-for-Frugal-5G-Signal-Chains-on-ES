function [ber] = dfrft_ofdm_im(snr_range, N, active_subcarriers)
% Simulates DFrFT-based OFDM with Index Modulation
ber = zeros(size(snr_range));
for i = 1:length(snr_range)
    snr = snr_range(i);
    bits = randi([0 1], active_subcarriers, 1);
    symbols = 2*bits - 1;
    freq_domain = zeros(N, 1);
    indices = randperm(N, active_subcarriers);
    freq_domain(indices) = symbols;
    time_domain = ifft(freq_domain);
    noise = randn(N,1) * sqrt(1/(2*10^(snr/10)));
    rx = time_domain + noise;
    ber(i) = sum(sign(real(rx(indices))) ~= bits) / active_subcarriers;
end
end