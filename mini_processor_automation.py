# ============================================================
# Project: Mini Processor Automation (Final Version)
# Author: Sathvik Ande
# Description:
# Automates Verilog compile + simulate + waveform view.
# Works across 'sources_1/new' and 'sim_1/new' folders.
# ============================================================

import subprocess
import os
import time

# ------------------------------------------------------------
# 🧩 Step 1: Define Project Root and Common Paths
# ------------------------------------------------------------
project_root = r"C:\Users\Sathx\mini_processer"
output_exe = os.path.join(project_root, "mini_processor_sim")

# Expected waveform location (Vivado/Icarus default)
vcd_guess = r"C:\Users\Sathx\mini_processer\mini_processer.srcs\sim_1\new\mini_processor.vcd"

# ------------------------------------------------------------
# 🔍 Step 2: Automatically Find All Verilog Files
# ------------------------------------------------------------
verilog_files = []
for root, dirs, files in os.walk(project_root):
    for f in files:
        if f.endswith(".v"):
            verilog_files.append(os.path.join(root, f))

if not verilog_files:
    print("❌ No Verilog files found under", project_root)
    exit(1)

print("🧩 Found Verilog files:")
for f in verilog_files:
    print("   ➜", os.path.relpath(f, project_root))

# ------------------------------------------------------------
# 🔧 Step 3: Compile All Verilog Files Using Icarus Verilog
# ------------------------------------------------------------
print("\n🔧 Compiling Verilog design and testbench...\n")

compile_cmd = ["iverilog", "-o", output_exe] + verilog_files
compile_result = subprocess.run(compile_cmd, capture_output=True, text=True)

if compile_result.returncode != 0:
    print("❌ Compilation Failed!\n")
    print(compile_result.stderr)
    exit(1)
else:
    print("✅ Compilation Successful!\n")

# ------------------------------------------------------------
# ▶ Step 4: Run Simulation
# ------------------------------------------------------------
print("▶ Running simulation...\n")

process = subprocess.Popen(["vvp", output_exe],
                           stdout=subprocess.PIPE,
                           stderr=subprocess.PIPE,
                           text=True)

log_lines = []
for line in process.stdout:
    line = line.strip()
    if line:
        print(line)
        log_lines.append(line)

# Wait for file to be written
time.sleep(1)

# ------------------------------------------------------------
# 🔍 Step 5: Locate the VCD File Automatically
# ------------------------------------------------------------
vcd_path = None

# 1️⃣ Try the known Vivado/Icarus default folder first
if os.path.exists(vcd_guess):
    vcd_path = vcd_guess

# 2️⃣ If not there, look for any .vcd file inside the project
if not vcd_path:
    for root, dirs, files in os.walk(project_root):
        for f in files:
            if f.endswith(".vcd"):
                vcd_path = os.path.join(root, f)
                break
        if vcd_path:
            break

# ------------------------------------------------------------
# 📈 Step 6: Open GTKWave if Found
# ------------------------------------------------------------
if vcd_path and os.path.exists(vcd_path):
    print(f"\n📈 Waveform file found at:\n{vcd_path}")
    print("Opening GTKWave...")
    subprocess.Popen(["gtkwave", vcd_path])
else:
    print("\n⚠️ Could not locate waveform file (.vcd).")
    print("   Please check the $dumpfile path in your testbench.")
    print("   Example: $dumpfile(\"C:/Users/Sathx/mini_processer/mini_processer.srcs/sim_1/new/mini_processor.vcd\");")

print("\n🎯 Automation complete.")
