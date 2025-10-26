# 🛰️ Federated AI-Monitored NOMA-aided DFrFT-OFDM with Index Modulation  
### _A Frugal 5G Signal Chain for Edge IoT and TinyML-Enabled ESP32 Systems_  

---

## 📖 Overview
This repository presents a **lightweight 5G/6G-compatible communication framework** that integrates  
**Discrete Fractional Fourier Transform (DFrFT)–based OFDM**, **Index Modulation (IM)**, and  
**Non-Orthogonal Multiple Access (NOMA)** with **Federated TinyML monitoring** deployed on ESP32-class edge devices.

The system enables **adaptive, privacy-preserving, and low-cost wireless connectivity** suitable for  
rural broadband, disaster-recovery, and large-scale IoT environments.

---

## 🚀 Key Contributions
- 🧠 **Federated TinyML-driven waveform adaptation** – Local ESP32 nodes predict modulation and power parameters based on SNR, BER, and PAPR.  
- ⚡ **DFrFT-OFDM with Index Modulation** – Reduces PAPR and improves spectral efficiency via fractional-domain rotation.  
- 📡 **NOMA-enabled multi-user fairness** – Power-domain superposition with successive interference cancellation (SIC).  
- 🔗 **Low-cost ESP32 deployment** – Real-time inference in ~40 ms per frame with <400 KB flash usage.  
- 📊 **Full simulation + embedded validation** – Python/MATLAB notebooks, waveform visualizations, and TinyML profiling included.

---

## 🧩 System Architecture
  +-------------------------------+
  |     Federated Aggregator      |
  |  (Model Update & Deployment)  |
  +---------------+---------------+
                  |
      Federated Weight Updates
                  |
| Edge Nodes (ESP32)                        |    |      |        |
| ----------------------------------------- | -- | ---- | ------ |
| DFrFT-OFDM                                | IM | NOMA | TinyML |
| +---------------+------+------+---------+ |    |      |        |
        ↕ Channel Feedback (SNR, PAPR)

---

## 🧠 Workflow Summary
1. **Simulation (Python/MATLAB):**  
   - DFrFT kernel generation  
   - IM mapping and NOMA power allocation  
   - BER and PAPR computation  

2. **TinyML Training (Python/TensorFlow):**  
   - Train small neural network to predict modulation/power control decisions.  
   - Quantize and export as `.tflite` for ESP32 deployment.  

3. **Federated Learning (Python):**  
   - Multiple simulated clients exchange local model updates.  
   - Aggregator computes global model convergence.  

4. **Embedded Testing (ESP32):**  
   - Load TinyML model and perform real-time inference.  
   - Measure latency, memory footprint, and inference accuracy.

---

## 🧪 Simulation Results
| Metric | Baseline OFDM | NOMA-OFDM | Proposed DFrFT-IM-NOMA |
|:-------|:--------------:|:----------:|:-----------------------:|
| **BER @ 20 dB** | 1.8 × 10⁻³ | 1.2 × 10⁻³ | **6.0 × 10⁻⁴** |
| **PAPR (dB)** | 9.2 | 7.8 | **6.1** |
| **Fairness Index** | 0.65 | 0.78 | **0.84** |
| **ESP32 Inference Latency** | – | – | **42 ms / frame** |

> See `/plots` for BER vs SNR, PAPR CCDF, and constellation diagrams.

---

## 🗂️ Repository Structure

---

## ⚙️ Installation
```bash
git clone https://github.com/hemanth-y50/Federated-AI-Monitored-NOMA-aided-DFrFT-OFDM-with-Index-Modulation-for-Frugal-5G-Signal-Chains-on-ES.git
cd Federated-AI-Monitored-NOMA-aided-DFrFT-OFDM-with-Index-Modulation-for-Frugal-5G-Signal-Chains-on-ES
python -m venv venv
source venv/bin/activate       # (Linux/Mac)
venv\Scripts\activate          # (Windows)
pip install -r requirements.txt
@misc{hemanth2025_frugal5g,
  author       = {Yenuganti Hemanth Kumar},
  title        = {Federated AI–Monitored NOMA-aided DFrFT-OFDM with Index Modulation for Frugal 5G Signal Chains on ESP32},
  year         = {2025},
  howpublished = {GitHub repository},
  url          = {https://github.com/hemanth-y50/Federated-AI-Monitored-NOMA-aided-DFrFT-OFDM-with-Index-Modulation-for-Frugal-5G-Signal-Chains-on-ES}
}

