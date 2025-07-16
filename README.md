
# 🧠 Smart Multi-Item FSM-Based Vending Machine (Verilog)

## 📘 Project Description

This project presents a **Verilog HDL-based smart vending machine** modeled as a **Finite State Machine (FSM)** that simulates real-world coin-operated behavior. The machine accepts coins of ₹1, ₹2, and ₹5 denominations and allows users to purchase either **Tea (₹5)** or **Coffee (₹7)**. The vending machine dynamically tracks the user's balance and dispenses the selected item when the balance meets or exceeds the item's cost.

What sets this project apart is the integration of **advanced FSM features** including:

- **Real-time stock management** for each item (Tea and Coffee) using counters.
- An **admin mode** that allows restocking of inventory via dedicated inputs.
- A **feedback system** that activates user-facing messages such as:
  - Machine ready (`msg_ready`)
  - Item dispensed (`msg_dispensed`)
  - Out of stock (`msg_out_of_stock`)
  - Insufficient funds (`msg_insufficient`)
- **Change return logic** to refund any excess balance after a successful transaction.

The entire design operates synchronously based on a clock (`clk`) and reset (`rst`) signal and is tested using a custom **Verilog testbench**. Multiple scenarios, such as overpayment, underpayment, admin restocking, and inventory depletion, are verified using waveform simulation tools (ModelSim or Vivado).

This project bridges fundamental FSM principles with real-world embedded system behavior, demonstrating a deeper understanding of control logic, user interaction, and modular design in digital hardware systems.

## ✅ Highlights

- FSM-driven state transitions
- Supports multiple products and flexible coin input
- Clean separation of user vs. admin control paths
- Waveform verification using realistic input sequences
- Extensible for future use with LCDs, keypads, or IoT integration

## 🛠 Tools Used

- Verilog HDL
- ModelSim / Vivado (for simulation and waveform analysis)
- Testbench design in Verilog

## 📦 Files

- `fsm_futureenhanced.v` — Main FSM vending machine module with stock/admin logic
- `tb3.v` — Testbench covering all input scenarios
- `block_diagram.png` — Block diagram (logic flow)
- `waveform_output.vcd` — Waveform for simulation validation

## 🚀 How to Run

1. Open project in ModelSim or Vivado
2. Compile `fsm_enhanced.v` and `tb3.v`
3. Simulate and view `fsm_enhanced.vcd` in waveform viewer

## ✍️ Author

**Stuteelekha Patnaik A 13**  
July 2025 — Final-year Verilog/Embedded Resume Project
