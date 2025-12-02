# LUX Protocol Documentation

**LUX is the reward layer of World Chain.**

This documentation provides everything you need to integrate LUX Protocol into your application.

## Quick Links

- **Website:** [Coming soon]
- **Token Contract:** [Worldscan](https://worldscan.org/address/0x6289D5B756982bbc2535f345D9D68Cb50c853F35)
- **Staking Contract:** [Worldscan](https://worldscan.org/address/0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5)
- **Network:** World Chain (Chain ID: 480)

## What is LUX Protocol?

LUX Protocol provides smart contracts and infrastructure for:
- **Staking** with on-chain yield
- **Quest system** for on-chain/off-chain tasks
- **Referral rewards** infrastructure
- **PowerBoost tier** system

## Mindset

**Luminex web + Mini App = official interfaces**  
**But protocol is open for everyone to use**

You can build your own interface, integrate LUX staking into your dApp, or use LUX as a reward token in your own experiences.

## Getting Started

See [QUICK_START.md](./QUICK_START.md) for code examples.

## Contract Addresses

### LUX Token
- **Address:** `0x6289D5B756982bbc2535f345D9D68Cb50c853F35`
- **Network:** World Chain (Chain ID: 480)
- **Explorer:** https://worldscan.org/address/0x6289D5B756982bbc2535f345D9D68Cb50c853F35

### Staking Contract
- **Address:** `0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5`
- **Explorer:** https://worldscan.org/address/0xDa210b809bB6171ed1B1C9Bd05340457dcb341C5

## Network Configuration

```typescript
import { defineChain } from 'viem'

export const worldChain = defineChain({
  id: 480,
  name: 'World Chain',
  nativeCurrency: {
    name: 'Worldcoin',
    symbol: 'WLD',
    decimals: 18,
  },
  rpcUrls: {
    default: {
      http: ['https://worldchain-rpc.publicnode.com'],
    },
  },
  blockExplorers: {
    default: {
      name: 'Worldscan',
      url: 'https://worldscan.org',
    },
  },
})
```

**RPC Endpoints:**
- Public: `https://worldchain-rpc.publicnode.com`
- Alchemy: `https://worldchain-mainnet.g.alchemy.com/v2/YOUR_KEY`

## Installation

```bash
# When @lux-protocol/abis package is published
npm install @lux-protocol/abis

# For now, copy ABIs from protocol/abis/ directory
```

## Resources

- [Quick Start Guide](./QUICK_START.md)
- [API Reference](./API_REFERENCE.md) (Coming soon)

