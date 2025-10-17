function [ber1, ber2] = noma_layer(snr_range, alpha)
% Simulates two-user NOMA with SIC
ber1 = zeros(size(snr_range));
ber2 = zeros(size(snr_range));
for i = 1:length(snr_range)
    snr = snr_range(i);
    bits1 = randi([0 1], 1000, 1);
    bits2 = randi([0 1], 1000, 1);
    P1 = alpha; P2 = 1 - alpha;
    x1 = sqrt(P1) * (2*bits1 - 1);
    x2 = sqrt(P2) * (2*bits2 - 1);
    tx = x1 + x2;
    noise = randn(size(tx)) * sqrt(1/(2*10^(snr/10)));
    rx = tx + noise;
    x1_hat = sign(rx);
    rx_residual = rx - sqrt(P1) * x1_hat;
    x2_hat = sign(rx_residual);
    ber1(i) = sum(bits1 ~= (x1_hat > 0)) / length(bits1);
    ber2(i) = sum(bits2 ~= (x2_hat > 0)) / length(bits2);
end
end