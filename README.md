# mini-processor-verilog-automation
Python-powered automation for Verilog simulations — automatically compiles, runs, and opens waveforms using Icarus Verilog &amp; GTKWave. Designed for a Mini Processor project by Sathvik Ande.
#  Mini Processor Automation using Verilog + Python
**Author:** Sathvik Ande  
**Tools Used:** Icarus Verilog • GTKWave • Python 3  

---

##  Project Overview
This project automates the entire Verilog simulation process for a **Mini Processor** design.  
Using Python, it:
- Finds all `.v` files in your project automatically  
- Compiles the design and testbench with **Icarus Verilog**  
- Runs the simulation  
- Opens the waveform output (`.vcd`) in **GTKWave**  

All steps happen **with one command** — no manual typing of `iverilog`, `vvp`, or `gtkwave`.

---

##  Features
 -Automatic Verilog file detection  
 -One-click compile + run  
 -Waveform opens instantly in GTKWave  
 -Works on Windows, macOS, and Linux  
 -No hardcoded paths (portable & GitHub-friendly)

---

## Folder Structure
mini-processor-verilog-automation/
├── run_verilog_auto.py
├── sources_1/new/ → Verilog design files
└── sim_1/new/ → Testbench files
