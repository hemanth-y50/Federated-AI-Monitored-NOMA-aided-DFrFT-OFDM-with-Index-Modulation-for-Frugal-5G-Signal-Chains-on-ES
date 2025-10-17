import numpy as np

def dfrft(x, a):
    N = len(x)
    n = np.arange(N)
    k = n.reshape((N, 1))
    W = np.exp(-2j * np.pi * a * k * n / N)
    return np.dot(W, x) / np.sqrt(N)
