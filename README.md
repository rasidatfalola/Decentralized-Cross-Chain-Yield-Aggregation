# Decentralized Cross-Chain Yield Aggregation

A decentralized system for aggregating and optimizing yield across multiple blockchains and DeFi protocols, built with Clarity smart contracts.

## Overview

This project implements a cross-chain yield aggregation system with the following components:

1. **Protocol Verification Contract**: Validates and maintains a registry of trusted DeFi platforms across different chains.
2. **Bridge Verification Contract**: Validates and maintains a registry of trusted cross-chain bridges.
3. **Yield Comparison Contract**: Tracks and analyzes yield returns across different protocols and chains.
4. **Asset Allocation Contract**: Manages the distribution of assets across different chains and protocols.
5. **Risk Assessment Contract**: Evaluates and quantifies the risk exposure across different chains and protocols.

## Contract Details

### Protocol Verification

The Protocol Verification contract maintains a list of verified DeFi protocols across different chains. Only verified protocols can be used in the yield aggregation system.

Key functions:
- `verify-protocol`: Add a protocol to the verified list
- `revoke-protocol`: Remove a protocol from the verified list
- `is-verified`: Check if a protocol is verified

### Bridge Verification

The Bridge Verification contract maintains a list of verified cross-chain bridges. These bridges are used to move assets between different chains.

Key functions:
- `verify-bridge`: Add a bridge to the verified list
- `revoke-bridge`: Remove a bridge from the verified list
- `is-bridge-verified`: Check if a bridge is verified for specific chains

### Yield Comparison

The Yield Comparison contract tracks and compares yields across different protocols and chains.

Key functions:
- `update-yield`: Update yield information for a protocol
- `get-yield`: Get yield information for a protocol
- `find-best-yield`: Find the best yield for an asset across all protocols and chains

### Asset Allocation

The Asset Allocation contract manages how assets are distributed across different chains and protocols.

Key functions:
- `set-allocation`: Set allocation for a user
- `get-allocation`: Get allocation for a user
- `rebalance`: Execute rebalancing based on current allocation

### Risk Assessment

The Risk Assessment contract evaluates the risk exposure across different chains and protocols.

Key functions:
- `update-protocol-risk`: Update risk score for a protocol
- `update-chain-risk`: Update risk score for a chain
- `get-protocol-risk`: Get risk score for a protocol
- `get-chain-risk`: Get risk score for a chain
- `calculate-allocation-risk`: Calculate combined risk for a specific allocation

## Getting Started

1. Clone this repository
2. Deploy the contracts to a Stacks blockchain node
3. Initialize the contracts by verifying protocols and bridges
4. Update yield and risk information
5. Set asset allocations and rebalance as needed

## Testing

Tests are written using Vitest. Run the tests with:

```bash
npm test
