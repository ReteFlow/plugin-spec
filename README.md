# ReteFlow Plugin Specification

![Protobuf](https://img.shields.io/badge/Proto-v3-blue.svg)
![Go](https://img.shields.io/badge/Go-1.25-blue.svg)

This repository contains the official Protobuf definitions for creating plugins for the **reteflow** workflow engine. It serves as the single source of truth for the plugin API contract.

## Overview

The core of the specification is defined in `reteflow/pluginspec/v1`, specifically the `PluginSpec` message, which defines the metadata and data contracts for all plugins.

- **Type-Safe:** Inputs and outputs are defined by their Protobuf message types.
- **Language-Agnostic:** You can use these definitions to generate client code in any language supported by Protobuf (Go, Rust, Python, TypeScript, etc.).
- **Stable Contract:** The API is versioned and managed using [Buf](https://buf.build).

## Project Structure

The definitions are organized into the following modules:

- **Core Plugin Spec** (`proto/reteflow/pluginspec/v1/`):
  - Defines the lifecycle of a plugin execution (`PluginCall`, `PluginCallResult`).
  - Defines configuration schemas (`PluginSpec`, `ConfigValue`).
- **Common Definitions** (`proto/reteflow/common/`):
  - **Solana** (`solana/v1/`): Shared definitions for Solana transactions, instructions, and simulation results.
  - **Events** (`events/v1/`): definitions for system events like `ManualWorkflowTrigger`.

## Getting Started

### Prerequisites

To work with these definitions or regenerate code, you need:
- [Buf CLI](https://buf.build/docs/installation)


## Development

This project uses a `Makefile` to simplify common tasks.

### Generating Code

To compile the Protobuf files and generate the Go language stubs:

```sh
make proto
```

*Note: This runs `buf build`, `buf dep update`, and `buf generate`.*

### Linting

To check the Protobuf files against style guides and breaking change detection:

```sh
make lint-proto
```

### Clean

To remove generated artifacts:

```sh
make clean-proto
```