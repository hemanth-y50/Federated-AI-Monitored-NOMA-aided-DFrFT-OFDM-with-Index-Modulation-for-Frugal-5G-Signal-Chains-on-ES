#include <Arduino.h>
#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "tensorflow/lite/version.h"
#include "model_data.h"  // your .tflite model as C array

// Arena size for model memory (adjust if model is larger)
constexpr int kTensorArenaSize = 20 * 1024;
uint8_t tensor_arena[kTensorArenaSize];

// TensorFlow Lite globals
const tflite::Model* model = nullptr;
tflite::MicroInterpreter* interpreter = nullptr;
tflite::AllOpsResolver resolver;

void setup() {
  Serial.begin(115200);
  delay(1000);

  Serial.println("🔹 Initializing TensorFlow Lite...");

  model = tflite::GetModel(model_data);
  if (model->version() != TFLITE_SCHEMA_VERSION) {
    Serial.println("❌ Model schema version mismatch!");
    while (1);
  }

  static tflite::MicroInterpreter static_interpreter(model, resolver, tensor_arena, kTensorArenaSize);
  interpreter = &static_interpreter;

  if (interpreter->AllocateTensors() != kTfLiteOk) {
    Serial.println("❌ Tensor allocation failed!");
    while (1);
  }

  Serial.println("✅ Model loaded successfully!");
}

void loop() {
  // Example input: SNR and Noise
  float snr = random(5, 20);
  float noise = 1.0 / pow(10, snr / 10);

  TfLiteTensor* input = interpreter->input(0);
  input->data.f[0] = snr;
  input->data.f[1] = noise;

  if (interpreter->Invoke() != kTfLiteOk) {
    Serial.println("❌ Inference failed!");
    delay(2000);
    return;
  }

  TfLiteTensor* output = interpreter->output(0);
  float prediction = output->data.f[0];

  Serial.print("SNR: ");
  Serial.print(snr);
  Serial.print(" → Prediction: ");
  Serial.println(prediction > 0.5 ? "Good Channel" : "Poor Channel");

  delay(2000);
}
