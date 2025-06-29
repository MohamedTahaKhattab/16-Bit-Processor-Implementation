# 16-Bit Processor Implementation in VHDL
(This is the final project of the Computer Architecture course at the Egyptian Chinese University (using VHDL))

## Project Overview

This project implements a complete 16-bit processor system designed in VHDL. The processor features a custom instruction set architecture with arithmetic, logical, shift, and memory operations. The design follows a modular approach with separate components for the ALU, control unit, memory, and program counter.

## Architecture

The processor implements a simple architecture with the following key characteristics:

- **Data Width**: 16-bit data path
- **Address Space**: 16-bit addressing
- **Instruction Format**: 16-bit instructions with 4-bit opcode and 12-bit address field
- **Register**: Single accumulator (AC) register
- **Memory**: Combined instruction and data memory with separate ROM and RAM sections

## Component Structure

### Core Components

**Processor (Processor.vhd)**
- Top-level entity that interconnects all processor components
- Manages data flow between ALU, memory, control unit, and program counter
- Implements the main processor datapath

**Arithmetic Logic Unit (ALU.vhd)**
- 16-bit ALU supporting arithmetic, logical, and shift operations
- Organized into four functional parts (PartA through PartD)
- Generates status flags: Negative, Zero, and Carry

**Control Unit (ControlUnit.vhd)**
- Decodes instruction opcodes
- Generates control signals for memory read/write and ALU enable
- Manages processor operation modes

**Main Memory (MainMemory.vhd)**
- Combined ROM/RAM memory system
- ROM stores program instructions
- RAM provides data storage
- Supports both instruction fetch and data access operations

### ALU Components

**PartA (PartA.vhd)**
- Arithmetic operations: addition, subtraction, increment, decrement
- Handles carry propagation for multi-bit operations

**PartB (PartB.vhd)**
- Logical operations: AND, OR, XOR, NOT
- Bitwise operations on 16-bit operands

**PartC (PartC.vhd)**
- Right shift operations: logical, arithmetic, and rotate
- Supports different shift modes based on control signals

**PartD (PartD.vhd)**
- Left shift operations: logical shift and rotate
- Includes reset functionality

### Supporting Components

**ALU Selector (ALU_Selc.vhd)**
- Maps instruction opcodes to ALU control signals
- Manages carry input for specific operations
- Enables appropriate ALU functionality based on instruction type

**Program Counter (PC.vhd)**
- 16-bit program counter with automatic increment
- Supports reset functionality
- Manages instruction sequencing

**Register (Register.vhd)**
- Generic register implementation
- Used for temporary data storage
- Supports synchronous reset and clock enable

**N-Bit Adder (NBitAdder.vhd)**
- Parameterized adder/subtractor implementation
- Built using full adder components
- Supports configurable bit width

**Full Adder (FA.vhd)**
- Basic building block for arithmetic operations
- Implements single-bit addition with carry

## Instruction Set

The processor supports the following instruction categories:

### Memory Operations
- **LOAD (0000)**: Load data from memory to accumulator
- **STORE (0001)**: Store accumulator data to memory

### Arithmetic Operations
- **ADD (0010)**: Add memory operand to accumulator
- **SUB (0011)**: Subtract memory operand from accumulator
- **INC (1101)**: Increment accumulator
- **DEC (1110)**: Decrement accumulator

### Logical Operations
- **AND (0100)**: Bitwise AND with memory operand
- **OR (0101)**: Bitwise OR with memory operand
- **XOR (0110)**: Bitwise XOR with memory operand
- **NOT (0111)**: Bitwise complement of accumulator

### Shift and Rotate Operations
- **SHL (1000)**: Shift left logical
- **SHR (1001)**: Shift right logical
- **ROL (1010)**: Rotate left
- **ROR (1011)**: Rotate right

### System Operations
- **RST (1111)**: Reset operation

## Sample Program

The memory component includes a sample program that demonstrates processor functionality:

```
Test Case: ((2+10-8)+1)-1 = 4

Instructions:
0: LOAD 2        ; Load constant 2 into accumulator
1: ADD 10        ; Add constant 10 (result: 12)
2: SUB 8         ; Subtract constant 8 (result: 4)
3: STORE result  ; Store result to memory
4: INC result    ; Increment stored value (result: 5)
5: STORE temp    ; Store incremented value
6: DEC temp      ; Decrement value (result: 4)
7: STORE final   ; Store final result
```

## File Organization

```
processor/src/
├── Processor.vhd          # Top-level processor entity
├── ALU.vhd               # Arithmetic Logic Unit
├── ControlUnit.vhd       # Instruction decoder and control
├── MainMemory.vhd        # Memory subsystem
├── PC.vhd                # Program counter
├── Register.vhd          # Register implementation
├── ALU_Selc.vhd          # ALU operation selector
├── PartA.vhd             # ALU arithmetic operations
├── PartB.vhd             # ALU logical operations
├── PartC.vhd             # ALU right shift operations
├── PartD.vhd             # ALU left shift operations
├── NBitAdder.vhd         # N-bit adder/subtractor
├── FA.vhd                # Full adder component
└── untitled.awc          # Active-HDL waveform configuration
```

## Design Features

**Modular Architecture**: The design separates concerns into distinct, reusable components that can be independently tested and verified.

**Parameterizable Design**: Most components use generic parameters to support different bit widths, enhancing design flexibility and reusability.

**Status Flag Generation**: The ALU generates standard processor flags (Negative, Zero, Carry) to support conditional operations and program flow control.

**Memory-Mapped Architecture**: The design uses a unified memory space for both instructions and data, simplifying the memory interface.

## Simulation and Testing

The project includes Active-HDL configuration files for simulation and waveform analysis. The sample program provides a comprehensive test case that exercises multiple instruction types and verifies correct processor operation.

## Usage

To use this processor design:

1. Load all VHDL files into your synthesis tool
2. Set Processor.vhd as the top-level entity
3. Configure the generic parameter 'n' for desired bit width (default: 16)
4. Apply clock and reset signals to begin operation
5. Monitor internal signals using the provided waveform configuration

## Dependencies

The design requires IEEE standard VHDL libraries:
- IEEE.std_logic_1164.all (for standard logic types)
- IEEE.numeric_std.all (for numeric operations)
- IEEE.std_logic_unsigned.all (for unsigned arithmetic)

This processor implementation demonstrates fundamental computer architecture concepts and provides a solid foundation for understanding digital processor design principles.
