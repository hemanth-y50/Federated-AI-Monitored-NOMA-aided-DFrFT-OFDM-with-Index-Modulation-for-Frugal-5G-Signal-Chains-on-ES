function [ber, papr] = ber_papr_analysis(signal, snr_db)
% Computes BER and PAPR for a given signal
noise = randn(size(signal)) * sqrt(1/(2*10^(snr_db/10)));
rx = signal + noise;
ber = sum(sign(real(rx)) ~= sign(real(signal))) / length(signal);
papr = max(abs(signal).^2) / mean(abs(signal).^2);
end