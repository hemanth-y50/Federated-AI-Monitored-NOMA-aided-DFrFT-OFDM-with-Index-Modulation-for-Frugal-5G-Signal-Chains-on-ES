function visualize_results(snr_range, ber, title_str, filename)
% Plots and saves BER vs SNR
figure;
plot(snr_range, ber, 'o-', 'LineWidth', 2);
xlabel('SNR (dB)');
ylabel('Bit Error Rate');
title(title_str);
grid on;
saveas(gcf, filename);
end
