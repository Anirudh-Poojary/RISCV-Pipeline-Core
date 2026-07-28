# RISC-V Pipeline Core (RV32I)

A modular implementation of a **32-bit RV32I Five-Stage Pipelined Processor** written in **Verilog HDL** and developed using **Xilinx Vivado Design Suite**.

This project demonstrates the implementation of a classical pipelined RISC-V processor following the RV32I instruction set architecture. The processor is divided into independent pipeline stages with dedicated control and datapath modules, making the design easy to understand, modify, and extend.

---

## Features

- 32-bit RV32I Processor
- Five-stage pipelined architecture
- Modular RTL design in Verilog HDL
- Separate Fetch, Decode, Execute, Memory and Write-back stages
- Instruction and Data Memory
- Register File
- Main Control Unit
- ALU Control Unit
- Sign Extension Unit
- Hazard Forwarding Unit
- Program Counter logic
- Pipeline datapath implementation
- GTKWave waveform configuration
- Developed and simulated using **Xilinx Vivado**

---

## Pipeline Stages

```
               +----------------+
               | Instruction IF |
               +-------+--------+
                       |
                       v
               +----------------+
               | Instruction ID |
               +-------+--------+
                       |
                       v
               +----------------+
               | Execute (EX)   |
               +-------+--------+
                       |
                       v
               +----------------+
               | Memory (MEM)   |
               +-------+--------+
                       |
                       v
               +----------------+
               | Write Back(WB) |
               +----------------+
```

---

## Project Structure

```
.
├── Pipeline_Top.v
├── pipeline_tb.v
│
├── Fetch_Cycle.v
├── Decode_Cyle.v
├── Execute_Cycle.v
├── Memory_Cycle.v
├── Writeback_Cycle.v
│
├── Instruction_Memory.v
├── Data_Memory.v
├── Register_File.v
├── PC.v
├── PC_Adder.v
│
├── Control_Unit_Top.v
├── Main_Decoder.v
├── ALU_Decoder.v
├── Hazard_unit.v
│
├── ALU.v
├── Sign_Extend.v
├── Mux.v
│
├── memfile.hex
├── pipeline.gtkw
└── README.md
```

---

## Module Description

### Pipeline_Top.v

Top-level module that integrates all processor stages and datapath components.

---

### pipeline_tb.v

Testbench used to simulate and verify processor functionality.

---

### Fetch_Cycle.v

Implements the Instruction Fetch stage.

Responsibilities:

- Program Counter update
- Instruction fetch
- PC increment
- Next PC selection

---

### Decode_Cyle.v

Implements the Instruction Decode stage.

Responsibilities:

- Register file access
- Instruction decoding
- Immediate generation
- Control signal generation

---

### Execute_Cycle.v

Implements the Execute stage.

Responsibilities:

- ALU operations
- Operand forwarding
- Branch target calculation
- Branch comparison

---

### Memory_Cycle.v

Implements the Memory stage.

Responsibilities:

- Data memory read
- Data memory write
- Memory interface

---

### Writeback_Cycle.v

Implements the Write Back stage.

Responsibilities:

- Select write-back source
- Update register file

---

### ALU.v

32-bit Arithmetic Logic Unit implementing arithmetic and logical operations.

---

### Main_Decoder.v

Generates processor control signals from instruction opcode.

---

### ALU_Decoder.v

Generates ALU control signals using ALUOp, funct3 and funct7 fields.

---

### Hazard_unit.v

Implements forwarding logic for reducing data hazards in the pipeline.

---

### Register_File.v

Implements the RV32I register file containing thirty-two 32-bit general-purpose registers.

---

### Instruction_Memory.v

Instruction memory initialized using `memfile.hex`.

---

### Data_Memory.v

Implements processor data memory.

---

### Sign_Extend.v

Generates immediate values for I, S, B, U and J instruction formats.

---

### PC.v

Program Counter register.

---

### PC_Adder.v

Computes sequential and branch target addresses.

---

### Mux.v

Parameterized multiplexer used throughout the datapath.

---

## Development Environment

The project was developed and verified using:

- **Xilinx Vivado Design Suite**
- Verilog HDL
- GTKWave (optional waveform viewer)

---

## Running the Project in Vivado

### 1. Create a New RTL Project

- Open **Vivado**
- Create a new RTL Project
- Do not specify sources initially (optional)

### 2. Add Design Sources

Add all Verilog source files except:

- `pipeline_tb.v`

### 3. Add Simulation Sources

Add:

```
pipeline_tb.v
```

### 4. Add Memory Initialization File

Add:

```
memfile.hex
```

to the project directory (or ensure the simulator can locate it).

### 5. Set the Top Modules

Design Top:

```
Pipeline_Top
```

Simulation Top:

```
pipeline_tb
```

### 6. Run Simulation

Navigate to:

```
Flow Navigator
    → Simulation
        → Run Behavioral Simulation
```

Vivado will compile the design and launch the simulation environment.

---

## Waveform Viewing

Simulation waveforms can be viewed directly within Vivado.

Alternatively, GTKWave users may load:

```
pipeline.gtkw
```

if VCD waveform generation is enabled.

---

## Learning Objectives

This project demonstrates:

- RISC-V RV32I Architecture
- Five-stage pipelining
- RTL Design in Verilog
- Datapath implementation
- Control Unit design
- Hazard forwarding
- Register file implementation
- Instruction and Data memory integration
- Processor verification using Vivado

---

## Future Improvements

- Hazard Detection Unit with pipeline stalls
- Load-use hazard handling
- Branch prediction
- Pipeline flushing
- CSR instructions
- RV32M Extension (Multiply/Divide)
- Cache memory
- Performance benchmarking
- Functional coverage and SystemVerilog verification

---

# My Project

## Screenshot

<img width="562" alt="Screenshot" src="https://github.com/user-attachments/assets/3d244cfa-2cc4-4733-a0fe-56e1fe11790f">
