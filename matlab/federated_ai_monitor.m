function acc = federated_ai_monitor(num_clients)
% Simulates federated averaging of TinyML models
acc = zeros(num_clients, 1);
for i = 1:num_clients
    snr = rand(500,1) * 20;
    noise = 1 ./ (10.^(snr/10));
    X = [snr noise];
    y = snr > 10;
    mdl = fitcsvm(X, y);
    y_pred = predict(mdl, X);
    acc(i) = sum(y_pred == y) / length(y);
end
end