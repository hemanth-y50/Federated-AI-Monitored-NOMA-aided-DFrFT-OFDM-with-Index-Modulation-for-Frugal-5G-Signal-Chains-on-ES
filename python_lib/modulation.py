import numpy as np

def qpsk_mod(bits):
    bits = bits.reshape(-1, 2)
    mapping = {
        (0,0): 1+1j, (0,1): -1+1j,
        (1,0): 1-1j, (1,1): -1-1j
    }
    return np.array([mapping[tuple(b)] for b in bits])

def qpsk_demod(symbols):
    bits = []
    for s in symbols:
        b0 = 0 if s.real > 0 else 1
        b1 = 0 if s.imag > 0 else 1
        bits.extend([b0, b1])
    return np.array(bits)
