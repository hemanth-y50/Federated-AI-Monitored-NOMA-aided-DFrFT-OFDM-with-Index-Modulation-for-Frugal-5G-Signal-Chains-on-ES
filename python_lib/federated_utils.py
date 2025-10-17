import numpy as np
from .tinyml_utils import create_model

def simulate_clients(num_clients=5, samples=500):
    models = []
    for _ in range(num_clients):
        model = create_model()
        snr = np.random.uniform(0, 20, samples)
        noise = 1 / (10 ** (snr / 10))
        X = np.stack([snr, noise], axis=1)
        y = (snr > 10).astype(int)
        model.fit(X, y, epochs=5, batch_size=32, verbose=0)
        models.append(model)
    return models

def federated_average(models):
    weights = [m.get_weights() for m in models]
    avg_weights = [np.mean(layer, axis=0) for layer in zip(*weights)]
    global_model = create_model()
    global_model.set_weights(avg_weights)
    return global_model
