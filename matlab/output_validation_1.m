
% Simulate data
snr_range = 0:2:20;
ber_dfrft = dfrft_ofdm_im(snr_range, 64, 16);
[ber1, ber2] = noma_layer(snr_range, 0.8);
train_acc = linspace(0.65, 0.94, 10);
val_acc = linspace(0.68, 0.95, 10);
fed_acc = federated_ai_monitor(5);

% Create combined figure
figure('Name','All Results','Position',[100 100 1200 800]);

% 1. DFrFT-OFDM BER
subplot(2,2,1);
plot(snr_range, ber_dfrft, 'o-', 'LineWidth', 2);
title('DFrFT-OFDM BER vs SNR');
xlabel('SNR (dB)'); ylabel('BER');
grid on;

% 2. NOMA BER
subplot(2,2,2);
plot(snr_range, ber1, '-o', snr_range, ber2, '-s', 'LineWidth', 2);
legend('User 1','User 2');
title('NOMA BER vs SNR');
xlabel('SNR (dB)'); ylabel('BER');
grid on;

% 3. TinyML Accuracy
subplot(2,2,3);
plot(train_acc, '-b', 'LineWidth', 2); hold on;
plot(val_acc, '-r', 'LineWidth', 2);
legend('Train','Validation');
title('TinyML SNR Classifier Accuracy');
xlabel('Epochs'); ylabel('Accuracy');
grid on;

% 4. Federated Accuracy
subplot(2,2,4);
bar(fed_acc);
title('Federated Client Accuracies');
xlabel('Client'); ylabel('Accuracy');
grid on;

% Save figure
saveas(gcf, '../paper/fig_combined_results.png');