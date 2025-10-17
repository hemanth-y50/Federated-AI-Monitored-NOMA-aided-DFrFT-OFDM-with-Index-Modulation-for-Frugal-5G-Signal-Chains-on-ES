import numpy as np

def power_allocation(P_total=1.0, alpha=0.8):
    return alpha * P_total, (1 - alpha) * P_total

def sic_receiver(y, P1, P2):
    x1_hat = np.sign(y)
    y_residual = y - np.sqrt(P1) * x1_hat
    x2_hat = np.sign(y_residual)
    return x1_hat, x2_hat
